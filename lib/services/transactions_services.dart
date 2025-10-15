import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanager/models/transaction_model.dart';
import 'package:financemanager/utils/date_formatter.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TransactionsServices {
  final user = FirebaseAuth.instance.currentUser;

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
