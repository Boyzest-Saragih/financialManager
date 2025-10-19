import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  TransactionModel({
    required this.date,
    required this.type,
    required this.amount,
    required this.desc,
    required this.category,
  });
  final DateTime date;
  final String type;
  final int amount;
  final String desc;
  final String category;

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    final dynamic dateValue = json['date'];
    DateTime dateParse;
    if (dateValue is Timestamp) {
      dateParse = dateValue.toDate();
    }else{
      dateParse = dateValue;
    }

    return TransactionModel(
      date: dateParse,
      type: json["type"] ?? "",
      amount: json["amount"] ?? 0,
      desc: json["desc"] ?? "",
      category: json["category"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "date": date,
    "type": type,
    "amount": amount,
    "desc": desc,
    "category": category,
  };
}
