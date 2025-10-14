import 'package:financemanager/models/monthly_expense_model.dart';
import 'package:financemanager/utils/idr_currency.dart';
import 'package:financemanager/utils/used_percentage.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/increasing_decreasing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  double getSliderValue(double valueExpense, double used) {
    return used > valueExpense ? valueExpense : used;
  }

  String getBudgetStatus(double valueExpense, double used) {
    final sisa = valueExpense - used;
    final label = sisa < 0 ? "over" : "left";
    return "${IdrCurrency.format(sisa.abs().toInt())} $label";
  }

  Color getColor(
    double valueExpense,
    double used, {
    Color normal = const Color.fromARGB(255, 33, 150, 243),
    Color warning = const Color.fromARGB(255, 244, 67, 54),
    Color success = const Color.fromARGB(255, 76, 175, 80),
  }) {
    if (used > valueExpense) return warning;
    if (used == valueExpense) return success;
    return normal;
  }

  @override
  Widget build(BuildContext context) {
    final datas = context.watch<List<MonthlyExpenseItem>>();
    print(datas);
    return Scaffold(
      body: ListView.separated(
        itemCount: datas.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (BuildContext context, int index) {
          final data = datas[index];
          return Container(
            padding: EdgeInsets.all(4),
            child: CustomCardContainer(
              childContainer: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 16,
                            color: Colors.blue,
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title),
                              const SizedBox(height: 5),
                              IncreasingDecreasing(
                                used: data.used,
                                valueExpenses: data.valueExpense,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(IdrCurrency.format(data.used.toInt())),
                          const SizedBox(height: 5),
                          Text(
                            "of ${IdrCurrency.format(data.valueExpense.toInt())}",
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 0,
                        disabledThumbRadius: 0,
                      ),
                      overlayShape: SliderComponentShape.noOverlay,
                    ),
                    child: Slider(
                      activeColor: getColor(data.valueExpense, data.used),
                      value: getSliderValue(data.valueExpense, data.used),
                      min: 0,
                      max: data.valueExpense,
                      onChanged: (v) {},
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        UsedPercentage.format(data.valueExpense, data.used),
                        style: TextStyle(
                          color: getColor(data.valueExpense, data.used),
                        ),
                      ),
                      Text(
                        getBudgetStatus(data.valueExpense, data.used),
                        style: TextStyle(
                          color: getColor(data.valueExpense, data.used),
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
