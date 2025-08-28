import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:financemanager/models/savings_goals_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SavingsGoalsServices {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> saveSavingGoal(
    List<SavingsGoalItem> savingGoalsData,
  ) async {
    final profile = ProfileSavingGoals(savingGoals: savingGoalsData);

    final docRef = FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .collection("financial_data")
        .doc('user_saving_goals');

    await docRef.set(profile.toMap(), SetOptions(merge: true));
  }
}
