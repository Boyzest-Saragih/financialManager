import 'package:cloud_firestore/cloud_firestore.dart';

class FinancialSummary {
  final int balance;
  final int monthlyIncome;

  FinancialSummary({required this.balance, required this.monthlyIncome});

  Map<String, dynamic> toFirestore() {
    return {'balance': balance, 'monthlyIncome': monthlyIncome};
  }

  factory FinancialSummary.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return FinancialSummary(
      balance: data['balance'] ?? 0,
      monthlyIncome: data['monthlyIncome'] ?? 0,
    );
  }
}
