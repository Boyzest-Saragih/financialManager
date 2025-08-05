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
  Map<String, int> _monthlyExpense = {};
  Map<String, int> get monthlyExpense => _monthlyExpense;

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
    required Map<String, int> valueMonthlyExpense,
    required int fieldLength,
  }) {
    if (valueMonthlyExpense.length == fieldLength) {
      _monthlyExpense = valueMonthlyExpense;
    } else {
      _monthlyExpense = {};
    }
    notifyListeners();
  }

  bool validateMonthlyExpenseInput() {
    if (_monthlyExpense.isEmpty) {
      return false;
    }
    print(monthlyExpense);
    return true;
  }

  Future<bool> continueStep(BuildContext context, int totalSteps) async {
    bool isValid = false;

    if (_currentStep == 1) {
      isValid = validateCurrBalanceInput(context);
    } else if (_currentStep == 2) {
      isValid = validateMonthlyExpenseInput();
    }

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
