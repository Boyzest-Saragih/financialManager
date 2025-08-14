import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MonthlyExpenseItem {
  final String title;
  final String desc;
  final double valueExpense;

  MonthlyExpenseItem({
    required this.title,
    required this.desc,
    required this.valueExpense,
  });

  factory MonthlyExpenseItem.fromMap(Map<String, dynamic> map) {
    return MonthlyExpenseItem(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      valueExpense: (map['valueExpense'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'valueExpense': valueExpense,
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
