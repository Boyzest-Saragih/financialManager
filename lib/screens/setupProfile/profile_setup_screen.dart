import 'package:financemanager/screens/setupProfile/current_balance_input.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  double slideVal = 1;
  final List<Widget> _screen = [CurrentBalanceInput()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            height: 99,
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("FinTrack Setup"),
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text("Step 1 of 4"),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Slider(
                  value: slideVal,
                  min: 0,
                  max: 4,
                  onChanged: (v) {
                    setState(() {
                      slideVal = v;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(16),
              child: _screen[slideVal.toInt() - 1],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            CustomCardContainer(
              widthContainer: 80,
              isShadow: false,
              childContainer: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [Icon(Icons.arrow_back), Text("Back")],
              ),
            ),
            CustomCardContainer(
              widthContainer: 106,
              isShadow: false,
              cardColor: Colors.blue,
              childContainer: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Continue", style: TextStyle(color: Colors.white)),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
