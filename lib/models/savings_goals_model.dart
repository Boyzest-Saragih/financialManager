import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class SavingsGoalItem {
  final String title;
  final String desc;
  final double target;
  final double progress;

  SavingsGoalItem({
    required this.title,
    required this.desc,
    required this.target,
    required this.progress,
  });

  factory SavingsGoalItem.fromMap(Map<String, dynamic> map) {
    return SavingsGoalItem(
      title: map['title'] ?? '',
      desc: map['desc'] ?? '',
      target: map['target'] ?? 0,
      progress: map['progress'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'desc': desc,
      'target': target,
      'progress': progress,
    };
  }
}


class ProfileSavingGoals {
  final List <SavingsGoalItem> savingGoals;
  ProfileSavingGoals({required this.savingGoals});

  
}
