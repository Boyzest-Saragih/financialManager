import 'package:financemanager/widgets/custom/custom_snackbar.dart';
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
  List<Map<String, dynamic>> _monthlyExpense = [];
  List<Map<String, dynamic>> get monthlyExpense => _monthlyExpense;

  // data step 3
  List<Map<String, dynamic>> _savingsGoals = [];
  List<Map<String, dynamic>> get savingsGoals => _savingsGoals;

  // Method step 1
  void updateCurrentBalanceInput({
    required String balance,
    required String income,
  }) {
    _currentBalance = balance;
    _monthlyIncome = income;
    notifyListeners();
  }

  bool validateCurrBalanceInput(BuildContext context) {
    if (_currentBalance.isEmpty || _monthlyIncome.isEmpty) {
      return false;
    }
    return true;
  }

  // Method step 2
  void updateMonthlyExpenseInput({
    required List<Map<String, dynamic>> monthlyExpenseData,
  }) {
    _monthlyExpense = monthlyExpenseData;

    notifyListeners();
  }

  bool validateMonthlyExpenseInput() {
    return _monthlyExpense.isNotEmpty &&
      _monthlyExpense.every((expense) => (expense['valueExpense'] as int) > 0);
  }

  // Method step 3
  void updateSavingsGoals({
    required List<Map<String, dynamic>> savingsGoalsData,
  }) {
    _savingsGoals = savingsGoalsData;
    notifyListeners();
  }

  bool validateSavingsGoalsInput() {
    return _savingsGoals.isNotEmpty &&
        _savingsGoals.every(
          (goal) => goal['judul'].isNotEmpty && goal['target_amount'] > 0,
        );
  }

  Future<bool> continueStep(BuildContext context, int totalSteps) async {
    bool isValid = false;

    if (_currentStep == 1) {
      isValid = validateCurrBalanceInput(context);
    } else if (_currentStep == 2) {
      isValid = validateMonthlyExpenseInput();
    } else if (_currentStep == 3) {
      isValid = validateSavingsGoalsInput();
    }else if(_currentStep == 4){
      isValid = true;
    }

      print("${_currentStep+1} < ${totalSteps}");
    if (isValid) {
      if (_currentStep < totalSteps) {
        _currentStep++;
        notifyListeners();
        return true;
      } else {
        print("Setup finish");
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
