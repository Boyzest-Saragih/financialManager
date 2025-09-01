import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class CashFlowScreen extends StatefulWidget {
  const CashFlowScreen({super.key});

  @override
  State<CashFlowScreen> createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Cash Flow", style: TextStyle(fontSize: 30)),
                      const Text("Track your income & expenses"),
                    ],
                  ),
                  Row(
                    children: [
                      CustomCardContainer(
                        onTapCard: () {},
                        isShadow: false,
                        padding: 6,
                        isBorder: true,
                        widthContainer: 85,
                        borderColor: Colors.grey,
                        childContainer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.black,
                            ),
                            const Text(
                              "Details",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      CustomCardContainer(
                        cardColor: Colors.blue,
                        isShadow: false,
                        padding: 6,
                        isBorder: true,
                        widthContainer: 70,
                        childContainer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            ),
                            const Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCardContainer(
                    widthContainer: 220,
                    childContainer: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.bar_chart, color: Colors.green),
                            const Text("Income"),
                          ],
                        ),
                        const SizedBox(height: 8),

                        const Text(
                          "Rp. 6.500.000",
                          style: TextStyle(color: Colors.green, fontSize: 18),
                        ),
                        const Text("This month"),
                        const SizedBox(height: 10),

                        const CustomCardContainer(
                          padding: 2,
                          borderRadius: 6,
                          cardColor: Colors.grey,
                          childContainer: Text(
                            "+6.9% vs last month",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomCardContainer(
                    widthContainer: 220,
                    childContainer: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.bar_chart, color: Colors.red),
                            const Text("Income"),
                          ],
                        ),
                        const SizedBox(height: 8),

                        const Text(
                          "Rp. 6.500.000",
                          style: TextStyle(color: Colors.red, fontSize: 18),
                        ),
                        const Text("This month"),
                        const SizedBox(height: 10),

                        const CustomCardContainer(
                          padding: 2,
                          borderRadius: 6,
                          cardColor: Colors.grey,
                          childContainer: Text(
                            "+6.9% vs last month",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              
            ],
          ),
        ),
      ),
    );
  }
}
