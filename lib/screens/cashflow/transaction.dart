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

    if (datas.isEmpty) {
      return Center(child: Text("Belum ada Transaksi"));
    }
    print(datas[0].date);

    return Scaffold(
      body: ListView.separated(
        itemCount: datas.length,
        separatorBuilder: (context, index) => const SizedBox(height: 6),
        itemBuilder: (context, index) {
          final data = datas[index];
          return Container(
            padding: const EdgeInsets.all(4),
            child: CustomCardContainer(
              isBorder: true,
              isShadow: false,
              childContainer: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          data.desc,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        IdrCurrency.format(data.amount),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomCardContainer(
                              isShadow: false,
                              cardColor: data.type=="Income"?Colors.blue.shade100:Colors.white60,
                              isBorder: data.type=="Expense"?true:false,
                              padding: 4,
                              childContainer: Text(
                                data.category,

                                style: const TextStyle(fontSize: 12),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                dateFormat(data.date),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 8),

                      CustomCardContainer(
                        padding: 4,
                        isShadow: false,
                        cardColor:
                            data.type == "Expense"
                                ? Colors.red.withOpacity(0.1)
                                : Colors.green.withOpacity(0.1),
                        childContainer: Text(
                          data.type,
                          style: TextStyle(
                            color:
                                data.type == "Expense"
                                    ? Colors.red
                                    : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
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
