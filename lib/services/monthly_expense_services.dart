import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanager/models/monthly_expense_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MonthlyExpenseServices {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> saveMonthlyExpense(
    List<MonthlyExpenseItem> monthlyExpenseData,
  ) async {
    final profile = ProfileMonthlyExpense(expenses: monthlyExpenseData);
    final docRef = FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .collection("financial_data")
        .doc('user_monthly_expenses');

    await docRef.set(profile.toMap(), SetOptions(merge: true));
    
  }

  Future<List<MonthlyExpenseItem>> getMonthlyExpenseItems() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return [];
    }

    final snapshot =
        await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .collection("financial_data")
            .doc('user_monthly_expenses')
            .get();

    if (!snapshot.exists) return [];

    final data = snapshot.data() as Map<String, dynamic>;
    final profile = ProfileMonthlyExpense.fromMap(data);

    return profile.expenses;
  }
}
