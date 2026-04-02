import 'package:financemanager/models/savings_goals_model.dart';
import 'package:financemanager/utils/idr_currency.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActiveGoals extends StatefulWidget {
  const ActiveGoals({super.key});

  @override
  State<ActiveGoals> createState() => _ActiveGoalsState();
}

class _ActiveGoalsState extends State<ActiveGoals> {
  @override
  Widget build(BuildContext context) {
    final savingDatas = context.watch<List<SavingsGoalItem>>();
    return ListView.builder(
      itemCount: savingDatas.length,
      itemBuilder: (context, index) {
        final data = savingDatas[index];
        return Padding(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 14),
          child: CustomCardContainer(
            isShadow: false,
            isBorder: true,
            childContainer: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.car_rental, size: 50),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Text(data.title), Text(data.desc)],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.edit),
                        const SizedBox(width: 16),

                        Icon(Icons.remove_circle_outline_outlined),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          IdrCurrency.format(1800000),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("current"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          IdrCurrency.format(2300000),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text("current"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Slider(value: 10, onChanged: (v) {}, max: 100, min: 0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("7.5% complete"), Text("12090 left")],
                ),
                const SizedBox(height: 16),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Target : ${IdrCurrency.format(data.target.toInt())}"),
                    Text("12090 day left"),
                  ],
                ),
                const SizedBox(height: 16),
                CustomCardContainer(
                  widthContainer: double.infinity,
                  padding: 8,
                  borderRadius: 10,
                  isShadow: false,
                  cardColor: Colors.blue,
                  onTapCard: () {},
                  childContainer: Center(
                    child: Text(
                      "Add Money",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
