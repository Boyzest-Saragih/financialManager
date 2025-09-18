import 'package:financemanager/providers/monthly_expenses_provider.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/increasing_decreasing.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MonthlyExpensesProvider>(
      context,
      listen: false,
    ).getMonthlyExpenseDatas();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final datas = context.watch<MonthlyExpensesProvider>().monthlyExpenseData;
    return Scaffold(
      body: ListView.separated(
        itemCount: datas.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (BuildContext context, int index) {
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
                              Text(datas[index].title),
                              const SizedBox(height: 5),
                              IncreasingDecreasing(used: datas[index].used, valueExpenses: datas[index].valueExpense)
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("200000"),
                          const SizedBox(height: 5),
                          Text("of ${datas[index].valueExpense}"),
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
                      activeColor: Colors.blue,
                      value: 20,
                      min: 0,
                      max: 100,
                      onChanged: (v) {},
                    ),
                  ),
                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("20% used"),
                      const Text("Rp. 50000 over"),
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
