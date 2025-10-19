import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanager/models/transaction_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionsServices {
  final user = FirebaseAuth.instance.currentUser;

  Stream<List<TransactionModel>> getTransactions() {
    if (user == null) {
      return Stream.value([]);
    }

    return FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .collection("transactions")
        .orderBy('date', descending: true)
        .limit(10)
        .snapshots()
        .map((snapshot) {
          if (snapshot.docs.isEmpty) {
            return [];
          }
          return snapshot.docs.map((doc) {
            final data = doc.data();
            print("data : ${data}");
            return TransactionModel.fromJson(data);
          }).toList();
        });
  }

  Future<void> saveTransactions(TransactionModel transactions) async {
    try {
      final docRef = FirebaseFirestore.instance
          .collection('user')
          .doc(user!.uid)
          .collection("transactions");

      await docRef.add(transactions.toJson());
      print("done");
    } catch (e) {
      rethrow;
    }
  }
}
