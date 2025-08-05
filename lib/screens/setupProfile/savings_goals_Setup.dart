import 'package:financemanager/providers/profile_setup_provider.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavingsGoalsSetup extends StatefulWidget {
  const SavingsGoalsSetup({super.key});

  @override
  State<SavingsGoalsSetup> createState() => _SavingsGoalsSetupState();
}

class _SavingsGoalsSetupState extends State<SavingsGoalsSetup> {
  // Gunakan list Map untuk data awal
  // Ini lebih mudah dikelola daripada List<List<dynamic>>
  final List<Map<String, dynamic>> _savingsGoals = [
    {
      "judul": TextEditingController(text: "Emergency Fund"),
      "target_amount": TextEditingController(),
      "desc": TextEditingController(text: "Safety net for unexpected expenses"),
    },
    {
      "judul": TextEditingController(text: "Vacation Fund"),
      "target_amount": TextEditingController(),
      "desc": TextEditingController(text: "Saving for a trip to Bali"),
    },
  ];

  // List ini akan menyimpan data akhir setelah diubah oleh user
  final List<Map<String, dynamic>> listFieldSavingsGoals = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi listFieldSavingsGoals dengan data dari _savingsGoals
    for (var goal in _savingsGoals) {
      listFieldSavingsGoals.add({
        "judul": goal["judul"]!.text,
        "target_amount": int.tryParse(goal["target_amount"]!.text) ?? 0,
        "desc": goal["desc"]!.text,
      });
    }
  }

  List<Widget> _buildCardSavingsGoalsInput() {
    final List<Widget> savingItemsWidget = [];

    for (var i = 0; i < _savingsGoals.length; i++) {
      savingItemsWidget.add(
        Column(
          children: [
            CustomCardContainer(
              childContainer: Column(
                children: [
                  CustomTextField(
                    controller: _savingsGoals[i]["judul"],
                    onChangedField: (v) {
                      listFieldSavingsGoals[i]["judul"] = v.toString();
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: _savingsGoals[i]["target_amount"],
                    hint: "Target amount",
                    onChangedField: (v) {
                      listFieldSavingsGoals[i]["target_amount"] = int.tryParse(v) ?? 0;
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: _savingsGoals[i]["desc"],
                    onChangedField: (v) {
                      listFieldSavingsGoals[i]["desc"] = v.toString();
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      );
    }

    return savingItemsWidget;
  }

  @override
  Widget build(BuildContext context) {
    print("Final List: $listFieldSavingsGoals");
    
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomCardContainer(
                isShadow: false,
                cardColor: Colors.purple,
                childContainer: Icon(
                  Icons.emoji_events,
                  size: 34,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Savings Goals",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "What are you saving for?",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              ..._buildCardSavingsGoalsInput(),
            ],
          ),
        ),
      ),
    );
  }
}