import 'package:financemanager/models/transaction_model.dart';
import 'package:financemanager/utils/date_formatter.dart';
import 'package:financemanager/utils/idr_currency.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    final datas = context.watch<List<TransactionModel>>();
    print(datas[0].date);

    if (datas.isEmpty) {
      return Center(child: Text("Belum ada Transaksi"));
    }

    return Scaffold(
      body: ListView.separated(
        itemCount: datas.length,
        separatorBuilder: (context, index) => const SizedBox(height: 6),
        itemBuilder: (context, index) {
          final data = datas[index];
          return Container(
            padding: EdgeInsets.all(4),
            child: CustomCardContainer(
              isBorder: true,
              isShadow: false,
              childContainer: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.desc),
                      Text(IdrCurrency.format(data.amount)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomCardContainer(
                            isShadow: false,
                            cardColor: Colors.blue,
                            padding: 2,
                            childContainer: Text(
                              data.type == 'Expense'
                                  ? data.category
                                  : data.type,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(dateFormat(data.date)),
                        ],
                      ),
                      CustomCardContainer(
                        padding: 1,
                        isShadow: false,
                        cardColor:
                            data.type == "Expense" ? Colors.red : Colors.green,
                        childContainer: Text(data.type),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
