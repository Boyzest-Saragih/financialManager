class TradeModel {
  final String? id;
  final String uid;
  final DateTime tradeTime;
  final String position;
  final String pair;
  final double margin;
  final int leverage;
  final double entryPrice;
  final double stopLoss;
  final double takeProfit;
  final String beforeChartLink;
  final String afterChartLink;
  final double exitPrice;
  final bool isDone;
  final double pnl;

  TradeModel({
    this.id,
    required this.uid,
    required this.tradeTime,
    required this.position,
    required this.pair,
    required this.margin,
    required this.leverage,
    required this.entryPrice,
    required this.stopLoss,
    required this.takeProfit,
    required this.beforeChartLink,
    required this.afterChartLink,
    required this.exitPrice,
    required this.isDone,
    required this.pnl,
  });

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'tradeTime': tradeTime.toIso8601String(),
        'position': position,
        'pair': pair,
        'margin': margin,
        'leverage': leverage,
        'entryPrice': entryPrice,
        'stopLoss': stopLoss,
        'takeProfit': takeProfit,
        'beforeChartLink': beforeChartLink,
        'afterChartLink': afterChartLink,
        'exitPrice': exitPrice,
        'isDone': isDone,
        'pnl': pnl,
      };

  factory TradeModel.fromMap(Map<String, dynamic> map, String id) {
    return TradeModel(
      id: id,
      uid: map['uid'] ?? '',
      tradeTime: DateTime.parse(map['tradeTime']),
      position: map['position'] ?? '',
      pair: map['pair'] ?? '',
      margin: (map['margin'] ?? 0).toDouble(),
      leverage: (map['leverage'] ?? 1).toInt(),
      entryPrice: (map['entryPrice'] ?? 0).toDouble(),
      stopLoss: (map['stopLoss'] ?? 0).toDouble(),
      takeProfit: (map['takeProfit'] ?? 0).toDouble(),
      beforeChartLink: map['beforeChartLink'] ?? '',
      afterChartLink: map['afterChartLink'] ?? '',
      exitPrice: (map['exitPrice'] ?? 0).toDouble(),
      isDone: map['isDone'] ?? false,
      pnl: (map['pnl'] ?? 0).toDouble(),
    );
  }
}
