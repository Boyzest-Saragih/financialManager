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
        return CustomCardContainer(
          childContainer: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.car_crash),
                  Column(children: [Text(data.title), Text(data.desc)]),
                  Icon(Icons.car_crash),
                  Icon(Icons.car_crash),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text("Rp. ${IdrCurrency.format(1800000)}"),
                      Text("current"),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Rp. ${IdrCurrency.format(2300000)}"),
                      Text("current"),
                    ],
                  ),
                ],
              ),
              Slider(value: 10, onChanged: (v) {}, max: 100, min: 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("7.5% complete"), Text("12090 left")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("Target complete"), Text("12090 day left")],
              ),
              CustomCardContainer(
                widthContainer: 300,
                isShadow: false,
                cardColor: Colors.blue,
                onTapCard: () {},
                childContainer: Text("Add Money"),
              ),
            ],
          ),
        );
      },
    );
  }
}
