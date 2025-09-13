import 'package:financemanager/models/monthly_expense_model.dart';
import 'package:financemanager/services/monthly_expense_services.dart';
import 'package:flutter/material.dart';

class MonthlyExpensesProvider extends ChangeNotifier {
  List<MonthlyExpenseItem> monthlyExpenseData = [];

  void getMonthlyExpenseDatas() async {
    monthlyExpenseData =
        await MonthlyExpenseServices().getMonthlyExpenseItems();

    notifyListeners();
  }
}
