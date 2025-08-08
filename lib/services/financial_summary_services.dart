import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanager/models/financial_summary.dart';
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
    print("Summary financial data success to save");
  }
}
