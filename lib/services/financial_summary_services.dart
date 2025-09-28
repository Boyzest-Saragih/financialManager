import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanager/models/financial_summary_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FinancialSummaryServices {
  Future<void> saveFinancialSummary({
    required int balance,
    required int monthlyIncome,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return;
    }

    final docRef = FirebaseFirestore.instance
        .collection('user')
        .doc(user.uid)
        .collection("financial_data")
        .doc('user_financial_summary');

    final summary = FinancialSummary(
      balance: balance,
      monthlyIncome: monthlyIncome,
    );

    await docRef.set(summary.toFirestore());
  }

  Stream<List<FinancialSummary>> getFinancialSummary() {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Stream.value([]);
    }

    return FirebaseFirestore.instance.collection('user').doc(user.uid).collection('financial_data').doc('user_financial_summary').snapshots().map((snapshot) {
      if (!snapshot.exists || snapshot.data() == null) {
        return [];
      }
      final data = snapshot.data() as Map<String, dynamic>;
      final profile = FinancialSummary.fromFirestore(data);
      return [profile];
    },);
  }
}
