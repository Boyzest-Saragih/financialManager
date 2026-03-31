import 'package:financemanager/screens/cashflow/add_dialog.dart';
import 'package:financemanager/screens/savings/banner_progress.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class SavingsScreen extends StatelessWidget {
  const SavingsScreen({super.key});
  
  TabController? get _tabController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(14),
          child: Column(
            children: [
              // title sction
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Savings Goals", style: TextStyle(fontSize: 26)),
                      const Text("Track multiple financial dreams"),
                    ],
                  ),
                  Column(
                    children: [
                      CustomCardContainer(
                        onTapCard: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddDialog(),
                          );
                        },
                        cardColor: Colors.blue,
                        isShadow: false,
                        padding: 6,
                        isBorder: true,
                        widthContainer: 115,
                        childContainer: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.add,
                              size: 25,
                              color: Colors.white,
                            ),
                            const Text(
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
            
              const SizedBox(height: 20,),
              // Banner Progress section
              BannerProgress()

            ],
          ),
        ),
      ),
    );
  }
}