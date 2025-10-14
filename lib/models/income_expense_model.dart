class IncomeExpenseModel {
  final String labelMonth;
  final double income;
  final double expense;

  IncomeExpenseModel({
    required this.labelMonth,
    required this.income,
    required this.expense,
  });

  double get net => income - expense;

  factory IncomeExpenseModel.fromMap(Map<String, dynamic> map, String docId) {
    return IncomeExpenseModel(
      labelMonth: map['labelMonth'] ?? '',
      income: (map['income'] ?? 0).toDouble(),
      expense: (map['expense'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {'labelMonth': labelMonth, 'income': income, 'expense': expense};
  }
}
