import 'package:financemanager/widgets/custom/custom_snackbar.dart';
import 'package:flutter/material.dart';

class ProfileSetupProvider extends ChangeNotifier {
  int _currentStep = 1;
  int get currentStep => _currentStep;

  String _currentBalance = '';
  String _monthlyIncome = '';

  String get currentBalance => _currentBalance;
  String get monthlyIncome => _monthlyIncome;

  void updateCurrentBalanceInput({required String balance, required String income}) {
    _currentBalance = balance;
    _monthlyIncome = income;
    notifyListeners();
  }

  bool validateCurrBalanceInput(BuildContext context) {
    if (_currentBalance.isEmpty || _monthlyIncome.isEmpty) {
      // ScaffoldMessenger.of(
      //   context,
      // ).showSnackBar(CustomSnackBar(message: "Plis di isi wak"));
      return false;
    }
    return true;
  }

  Future <bool> continueStep (BuildContext context, int totalSteps) async {
    bool isValid = false;

    if (_currentStep ==1) {
      isValid = validateCurrBalanceInput(context);
    }
    // else if(_currentStep ==2){
    //   // todo
    // }

    if(isValid){
      if(_currentStep < totalSteps){
        _currentStep++;
        notifyListeners();
        return true;
      }else{
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
