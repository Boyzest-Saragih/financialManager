import 'package:financemanager/screens/cashflow/add_dialog.dart';
import 'package:financemanager/screens/cashflow/categories.dart';
import 'package:financemanager/screens/cashflow/transaction.dart';
import 'package:financemanager/screens/savings/active_goals.dart';
import 'package:financemanager/screens/savings/banner_progress.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class SavingsScreen extends StatefulWidget {
  const SavingsScreen({super.key});

  @override
  State<SavingsScreen> createState() => _SavingsScreenState();
}

// Tambahkan SingleTickerProviderStateMixin agar TabController bisa bekerja dengan 'vsync: this'
class _SavingsScreenState extends State<SavingsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi controller di sini
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // Hapus controller dari memori saat widget dihancurkan
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              // title section
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Savings Goals",
                        style: TextStyle(fontSize: 26),
                      ),
                      Text("Track multiple financial dreams"),
                    ],
                  ),
                  Column(
                    children: [
                      CustomCardContainer(
                        onTapCard: () {
                          showDialog(
                            context: context,
                            builder: (context) => const AddDialog(),
                          );
                        },
                        cardColor: Colors.blue,
                        isShadow: false,
                        padding: 6,
                        isBorder: true,
                        widthContainer: 115,
                        childContainer: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            ),
                            Text(
                              "New Goal",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),
              // Banner Progress section
              const BannerProgress(),

              TabBar(
                controller: _tabController,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(text: "Active Goals"),
                  Tab(text: "Savings Goals"),
                ],
              ),

              const SizedBox(height: 20),
              SizedBox(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    ActiveGoals(),
                    Transaction(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}