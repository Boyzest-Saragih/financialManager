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
    return TransactionModel(
      date: json["date"]??DateTime.now(),
      type: json["type"] ?? "",
      amount: json["amount"] ?? 0,
      desc: json["desc"] ?? "",
      category: json["category"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "date":date,
    "type": type,
    "amount": amount,
    "desc": desc,
    "category": category,
  };
}
