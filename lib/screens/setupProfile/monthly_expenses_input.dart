import 'package:financemanager/providers/profile_setup_provider.dart';
import 'package:provider/provider.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';

class MonthlyExpensesInput extends StatefulWidget {
  const MonthlyExpensesInput({super.key});

  @override
  State<MonthlyExpensesInput> createState() => _MonthlyExpensesInputState();
}

class _MonthlyExpensesInputState extends State<MonthlyExpensesInput> {
  final List<Map<String, dynamic>> _monthlyExpenses = [
    {
      "icon": Icon(Icons.house, size: 30, color: Colors.white),
      "title": 'Housing',
      "desc": "Rent, mortgage, utilities",
      "valueExpense": TextEditingController(),
    },
    // {
    //   "icon": Icon(Icons.dining, size: 30, color: Colors.white),
    //   "title": 'Food & Dining',
    //   "desc": "Groceries, restaurants",
    //   "valueExpense": TextEditingController(),
    // },
    // {
    //   "icon": Icon(Icons.car_crash, size: 30, color: Colors.white),
    //   "title": 'Transportation',
    //   "desc": "Gas, car payments, transit",
    //   "valueExpense": TextEditingController(),
    // },
    // {
    //   "icon": Icon(Icons.gamepad, size: 30, color: Colors.white),
    //   "title": 'Entertainment',
    //   "desc": "Movies, games, hobbies",
    //   "valueExpense": TextEditingController(),
    // },
    // {
    //   "icon": Icon(Icons.shop, size: 30, color: Colors.white),
    //   "title": 'Shopping',
    //   "desc": "Clothes, electronics, misc",
    //   "valueExpense": TextEditingController(),
    // },
    // {
    //   "icon": Icon(Icons.heart_broken, size: 30, color: Colors.white),
    //   "title": 'Health & Fitness',
    //   "desc": "Gym, healthcare, supplements",
    //   "valueExpense": TextEditingController(),
    // },
    // {
    //   "icon": Icon(Icons.trending_up, size: 30, color: Colors.white),
    //   "title": 'Subscriptions',
    //   "desc": "Netflix, Spotify, software",
    //   "valueExpense": TextEditingController(),
    // },
    // {
    //   "icon": Icon(Icons.attach_money, size: 30, color: Colors.white),
    //   "title": 'Others',
    //   "desc": "Miscellaneous expensess",
    //   "valueExpense": TextEditingController(),
    // },
  ];

  List<Map<String, dynamic>> _buildMonthlyExpensesDataList() {
    return _monthlyExpenses.map((expense) {
      return {
        "title": expense['title'],
        "desc": expense['desc'],
        "valueExpense": int.tryParse(expense["valueExpense"]!.text) ?? 0,
      };
    }).toList();
  }

  List<Widget> _buildCardExpensesInput() {
    final List<Widget> expenseWidget = [];

    for (var i = 0; i < _monthlyExpenses.length; i++) {
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
                        childContainer: _monthlyExpenses[i]["icon"],
                      ),

                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _monthlyExpenses[i]["title"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            _monthlyExpenses[i]["desc"],
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  CustomTextField(
                    isNumber: true,
                    hint: "amount",
                    controller: _monthlyExpenses[i]["valueExpense"],
                    focusNode: _focusNodes[i],
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

  final List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _monthlyExpenses.length; i++) {
      _focusNodes.add(FocusNode());
      _focusNodes[i].addListener(() {
        if (!_focusNodes[i].hasFocus) {
          final updatedExpenses = _buildMonthlyExpensesDataList();
          context.read<ProfileSetupProvider>().updateMonthlyExpenseInput(
            monthlyExpenseData: updatedExpenses,
          );
        }
      });
    }
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
