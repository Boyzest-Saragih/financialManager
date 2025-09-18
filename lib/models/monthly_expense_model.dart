class MonthlyExpenseItem {
  final String title;
  final String desc;
  final double valueExpense;
  final double used;

  MonthlyExpenseItem({
    required this.title,
    required this.desc,
    required this.valueExpense,
    required this.used,
  });

  factory MonthlyExpenseItem.fromMap(Map<String, dynamic> map) {
    return MonthlyExpenseItem(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      valueExpense: (map['valueExpense'] ?? 0).toDouble(),
      used: (map['used']??0).toDouble()
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'valueExpense': valueExpense,
      'used':used
    };
  }
}

class ProfileMonthlyExpense {
  final List<MonthlyExpenseItem> expenses;

  ProfileMonthlyExpense({required this.expenses});

  factory ProfileMonthlyExpense.fromMap(Map<String, dynamic> map) {
    return ProfileMonthlyExpense(
      expenses:
          List<Map<String, dynamic>>.from(
            map['expenses'] ?? [],
          ).map((e) => MonthlyExpenseItem.fromMap(e)).toList(),
    );
  }

  Map<String,dynamic> toMap(){
    return{
      'expenses':expenses.map((e)=>e.toMap()).toList()
    };
  }
}
