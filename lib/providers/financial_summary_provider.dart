import 'package:financemanager/services/financial_summary_services.dart';
import 'package:flutter/material.dart';

class FinancialSummaryProvider  extends ChangeNotifier {
  final financialSummary = FinancialSummaryServices();
  int balance = 0;
  int monthlyIncome = 0;
  void getSumarriesFinancial()async{
    final summaries = await financialSummary.getFinancialSummary();
    balance = summaries[0].balance;
    monthlyIncome = summaries[0].monthlyIncome;
    print(balance);

    notifyListeners();
  }
  
}