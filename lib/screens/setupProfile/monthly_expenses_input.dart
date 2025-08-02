import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';

class MonthlyExpensesInput extends StatefulWidget {
  const MonthlyExpensesInput({super.key});

  @override
  State<MonthlyExpensesInput> createState() => _MonthlyExpensesInputState();
}

class _MonthlyExpensesInputState extends State<MonthlyExpensesInput> {
  final List<List<dynamic>> _listContentField = [
    [
      Icon(Icons.house, size: 30, color: Colors.white),
      'Housing',
      "Rent, mortgage, utilities",
      TextEditingController(),
    ],
    [
      Icon(Icons.dining, size: 30, color: Colors.white),
      'Food & Dining',
      "Groceries, restaurants",
      TextEditingController(),
    ],
    [
      Icon(Icons.car_crash, size: 30, color: Colors.white),
      'Transportation',
      "Gas, car payments, transit",
      TextEditingController(),
    ],
    [
      Icon(Icons.gamepad, size: 30, color: Colors.white),
      'Entertainment',
      "Movies, games, hobbies",
      TextEditingController(),
    ],
    [
      Icon(Icons.shop, size: 30, color: Colors.white),
      'Shopping',
      "Clothes, electronics, misc",
      TextEditingController(),
    ],
    [
      Icon(Icons.heart_broken, size: 30, color: Colors.white),
      'Health & Fitness',
      "Gym, healthcare, supplements",
      TextEditingController(),
    ],
    [
      Icon(Icons.trending_up, size: 30, color: Colors.white),
      'Subscriptions',
      "Netflix, Spotify, software",
      TextEditingController(),
    ],
    [
      Icon(Icons.attach_money, size: 30, color: Colors.white),
      'Others',
      "Miscellaneous expensess",
      TextEditingController(),
    ],
  ];

  List<Widget> _buildCardExpensesInput() {
    final List<Widget> expenseWidget = [];
    for (var i = 0; i < _listContentField.length; i++) {
      expenseWidget.add(
        Column(
          children: [
            CustomCardContainer(
              isShadow: false,
              childContainer: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomCardContainer(
                        isShadow: false,
                        padding: 8,
                        cardColor: Colors.lightBlue,
                        childContainer: _listContentField[i][0],
                      ),

                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _listContentField[i][1],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _listContentField[i][2],
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  CustomTextField(
                    isNumber: true,
                    controller: _listContentField[i][3],
                    hint: "0",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }
    return expenseWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 16),
              const CustomCardContainer(
                isShadow: false,
                cardColor: Colors.green,
                childContainer: Icon(
                  Icons.shopping_cart,
                  size: 34,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Monthly Expenses",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "Help us understand your spending patterns",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),

              ..._buildCardExpensesInput(),
            ],
          ),
        ),
      ),
    );
  }
}
