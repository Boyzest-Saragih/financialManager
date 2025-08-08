class FinancialSummary {
  final int balance;
  final int monthlyIncome;

  FinancialSummary({required this.balance, required this.monthlyIncome});


  Map<String, dynamic> toFirestore(){
    return{
      'balance': balance,
      'monthlyIncome':monthlyIncome
    };
  }
}