// import 'package:financemanager/services/auth_services.dart';
import 'package:financemanager/models/financial_summary_model.dart';
import 'package:financemanager/utils/idr_currency.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_chart/line_chart_net_income.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('EEEE, MMMM d');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    final balance = context.watch<List<FinancialSummary>>()[0].balance;
    final monthlyIncome = context.watch<List<FinancialSummary>>()[0].monthlyIncome;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section 1
              Text("Good Evening! 👋", style: TextStyle(fontSize: 30)),
              Text(formatDate(DateTime.now())),

              const SizedBox(height: 10),

              // Section 2
              Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF3D83F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[
                    Text(
                      "Total Balance",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      IdrCurrency.format(balance),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.trending_up, color: Colors.white),
                        SizedBox(width: 5),
                        Text(
                          "+12.5% from last month",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Section 3
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    width: 185,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.attach_money, size: 36, color: Colors.green),
                        const SizedBox(height: 12),
                        Text(
                          "+${IdrCurrency.format(monthlyIncome)}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Monthly Income",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 1,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Text(
                            "+15% vs last month",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: 185,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.track_changes,
                          size: 36,
                          color: Colors.orange,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "70%",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Goals Progress",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 1,
                            vertical: 1,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Text(
                            "4 active goals",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Section 4 line chart
              CustomCardContainer(
                childContainer: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Weekly Net Worth Trend",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bar_chart),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 300,

                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: LineChartNetIncome(),
                      ),
                    ),

                    const SizedBox(height: 14),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 14),

                    // Bottom Line chart section
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text("This Week"),
                              Text(
                                "+Rp 100.000",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("+5.50%", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Best Week"),
                              Text(
                                "+Rp 200.000",
                                style: TextStyle(
                                  color: const Color.fromARGB(
                                    255,
                                    41,
                                    150,
                                    239,
                                  ),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("jan W2", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                          Column(
                            children: [
                              const Text("Avg Week"),
                              Text(
                                "+Rp 50.000",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("+1.50%", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Section 4 quick actions
              CustomCardContainer(
                childContainer: Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Quick Actions",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CustomCardContainer(
                              widthContainer: 170,
                              cardColor: const Color(0xFFF9FAFB),
                              isShadow: false,
                              isBorder: true,
                              childContainer: Column(
                                children: [
                                  const Icon(
                                    Icons.attach_money,
                                    size: 24,
                                    color: Colors.red,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Add Expense",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text("Quick entry"),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CustomCardContainer(
                              widthContainer: 170,
                              cardColor: const Color(0xFFF9FAFB),
                              isShadow: false,
                              isBorder: true,
                              childContainer: Column(
                                children: [
                                  const Icon(
                                    Icons.document_scanner_outlined,
                                    size: 24,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Scan Receipt",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text("AI powered"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: CustomCardContainer(
                              widthContainer: 170,
                              cardColor: const Color(0xFFF9FAFB),
                              isShadow: false,
                              isBorder: true,
                              childContainer: Column(
                                children: [
                                  const Icon(
                                    Icons.track_changes_outlined,
                                    size: 24,
                                    color: Colors.purple,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "Add Savings",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text("4 goals"),
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: CustomCardContainer(
                              widthContainer: 170,
                              cardColor: const Color(0xFFF9FAFB),
                              isShadow: false,
                              isBorder: true,
                              childContainer: Column(
                                children: [
                                  const Icon(
                                    Icons.bar_chart,
                                    size: 24,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "View Details",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text("Full analysis"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Section Smart Insight
              CustomCardContainer(
                childContainer: Container(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Smart Insight",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      CustomCardContainer(
                        isBorder: true,
                        isShadow: false,
                        borderColor: Colors.green,
                        cardColor: Colors.green.withOpacity(0.2),
                        childContainer: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 16,
                                  color: Colors.green,
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Savings Milestone!",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Flexible(
                                  child: const Text(
                                    "You've reached 75% of your oooooooosaahdanv asnasfn emergency fund goal! 🎉",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Text(
                                  "2h ago",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      CustomCardContainer(
                        isBorder: true,
                        isShadow: false,
                        borderColor: Colors.amber,
                        cardColor: Colors.amber.withOpacity(0.2),
                        childContainer: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 16,
                                  color: Colors.amber,
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Budget Alert",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Flexible(
                                  child: const Text(
                                    "Food spending is 8% above budget this month",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Text(
                                  "4h ago",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),

                      CustomCardContainer(
                        isBorder: true,
                        isShadow: false,
                        borderColor: const Color.fromARGB(255, 213, 213, 213),
                        cardColor: Color.fromARGB(255, 213, 213, 213).withOpacity(0.2),
                        childContainer: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.circle,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Expense Insight",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Flexible(
                                  child: const Text(
                                    "You saved \$50 on transportation this month!",
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const SizedBox(width: 30),
                                Text(
                                  "6h ago",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
