class FinancialSummary {
  final int balance;
  final int monthlyIncome;

  FinancialSummary({required this.balance, required this.monthlyIncome});

  Map<String, dynamic> toFirestore() {
    return {'balance': balance, 'monthlyIncome': monthlyIncome};
  }

  factory FinancialSummary.fromFirestore(Map<String, dynamic> data) {
    return FinancialSummary(
      balance: data['balance'] ?? 0,
      monthlyIncome: data['monthlyIncome'] ?? 0,
    );
  }
}
