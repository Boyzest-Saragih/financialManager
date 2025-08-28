import 'package:financemanager/models/monthly_expense_model.dart';
import 'package:financemanager/models/savings_goals_model.dart';
import 'package:financemanager/services/auth_services.dart';
import 'package:financemanager/services/financial_summary_services.dart';
import 'package:financemanager/services/monthly_expense_services.dart';
import 'package:financemanager/services/savings_goals_services.dart';
import 'package:flutter/material.dart';

class ProfileSetupProvider extends ChangeNotifier {
  int _currentStep = 1;
  int get currentStep => _currentStep;

  // data step 1
  String _currentBalance = '';
  String _monthlyIncome = '';
  String get currentBalance => _currentBalance;
  String get monthlyIncome => _monthlyIncome;

  // data step 2
  final List<MonthlyExpenseItem> _monthlyExpense = [];
  List<MonthlyExpenseItem> get monthlyExpense => _monthlyExpense;

  // data step 3
  final List<SavingsGoalItem> _savingsGoals = [];
  List<SavingsGoalItem> get savingsGoals => _savingsGoals;

  // Method step 1
  void updateCurrentBalanceInput({
    required String balance,
    required String income,
  }) {
    _currentBalance = balance;
    _monthlyIncome = income;
    notifyListeners();
  }

  bool validateCurrBalanceInput() {
    if (_currentBalance.isEmpty || _monthlyIncome.isEmpty) {
      return false;
    }
    return true;
  }

  // Method step 2
  void updateMonthlyExpenseInput({
    required List<Map<String, dynamic>> monthlyExpenseData,
  }) {
    _monthlyExpense.clear();

    _monthlyExpense.addAll(
      monthlyExpenseData.map(
        (data) => MonthlyExpenseItem(
          title: data['title'] ?? '',
          desc: data['desc'] ?? '',
          valueExpense: (data['valueExpense'] ?? 0).toDouble(),
        ),
      ),
    );

    notifyListeners();
  }

  bool validateMonthlyExpenseInput() {
    return _monthlyExpense.isNotEmpty &&
        _monthlyExpense.every((expense) => expense.valueExpense > 0);
  }

  // Method step 3
  void updateSavingsGoals({
    required List<Map<String, dynamic>> savingsGoalsData,
  }) {
    _savingsGoals.clear();
    _savingsGoals.addAll(
      savingsGoalsData.map(
        (data) => SavingsGoalItem(
          title: data['title'],
          desc: data['desc'],
          target: (data['target_amount']).toDouble(),
          progress: 0,
        ),
      ),
    );
    notifyListeners();
  }

  bool validateSavingsGoalsInput() {
    return _savingsGoals.isNotEmpty &&
        _savingsGoals.every((goal) => goal.target > 0);
  }

  Future<void> saveFinancialData() async {
    try {
      await AuthServices().updateIsSetupProfile(true);
      await FinancialSummaryServices().saveFinancialSummary(
        balance: int.parse(currentBalance),
        monthlyIncome: int.parse(monthlyIncome),
      );
      await MonthlyExpenseServices().saveMonthlyExpense(monthlyExpense);
      await SavingsGoalsServices().saveSavingGoal(savingsGoals);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> continueStep(int totalSteps) async {
    bool isValid = false;

    if (_currentStep == 1) {
      isValid = validateCurrBalanceInput();
    } else if (_currentStep == 2) {
      isValid = validateMonthlyExpenseInput();
    } else if (_currentStep == 3) {
      isValid = validateSavingsGoalsInput();
    } else if (_currentStep == 4) {
      await saveFinancialData();
      _currentStep++;

      isValid = true;
    }

    if (isValid) {
      if (_currentStep < totalSteps) {
        _currentStep++;
        notifyListeners();
        return true;
      } else {
        return true;
      }
    }
    return false;
  }

  void goToPreviousStep() {
    if (_currentStep > 1) {
      _currentStep--;
      notifyListeners();
    }
  }
}
