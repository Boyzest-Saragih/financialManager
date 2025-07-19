import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/trade_model.dart';

class TradeServices {
  final _trade = FirebaseFirestore.instance.collection('trade');

  Stream<List<TradeModel>> getTrade(String uid){
    return _trade.where('uid',isEqualTo: uid).snapshots().map(
      (snapshot)=>snapshot.docs.map((doc)=>TradeModel.fromMap(doc.data(), doc.id)).toList()
    );
  }

  Future<void> addTrade(TradeModel trade) async{
    await _trade.add(trade.toMap());
  }

  Future <void> updateTrade(TradeModel trade) async{
    await _trade.doc(trade.id).update(trade.toMap());
  }

  Future<void> deleteTrade(String id) async{
    await _trade.doc(id).delete();
  }
}