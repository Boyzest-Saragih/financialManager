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

  // Helper method untuk mengonversi controllers ke data
  List<Map<String, dynamic>> _buildSavingsGoalsDataList() {
    return _savingsGoals.map((goal) {
      return {
        "judul": goal["judul"]!.text,
        "target_amount": int.tryParse(goal["target_amount"]!.text) ?? 0,
        "desc": goal["desc"]!.text,
      };
    }).toList();
  }

  // Helper method untuk membangun UI input
  List<Widget> _buildCardSavingsGoalsInput() {
    final List<Widget> savingItemsWidget = [];
    final setupFlowProvider = context.read<ProfileSetupProvider>();

    for (var i = 0; i < _savingsGoals.length; i++) {
      savingItemsWidget.add(
        Column(
          children: [
            CustomCardContainer(
              childContainer: Column(
                children: [
                  CustomTextField(
                    borderColor: const Color.fromARGB(255, 233, 233, 235),
                    fillColor: const Color.fromARGB(255, 233, 233, 235),
                    controller: _savingsGoals[i]["judul"],
                    onChangedField: (v) {
                      setupFlowProvider.updateSavingsGoals(
                        savingsGoalsData: _buildSavingsGoalsDataList(),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    borderColor: const Color.fromARGB(255, 233, 233, 235),
                    fillColor: const Color.fromARGB(255, 233, 233, 235),
                    isNumber: true,
                    controller: _savingsGoals[i]["target_amount"],
                    hint: "Target amount",
                    onChangedField: (v) {
                      setupFlowProvider.updateSavingsGoals(
                        savingsGoalsData: _buildSavingsGoalsDataList(),
                      );
                    },
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    borderColor: const Color.fromARGB(255, 233, 233, 235),
                    fillColor: const Color.fromARGB(255, 233, 233, 235),
                    controller: _savingsGoals[i]["desc"],
                    onChangedField: (v) {
                      setupFlowProvider.updateSavingsGoals(
                        savingsGoalsData: _buildSavingsGoalsDataList(),
                      );
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

  void _addFieldSavingsGoals() {
    setState(() {
      _savingsGoals.add({
        "judul": TextEditingController(text: "Goal name"),
        "target_amount": TextEditingController(),
        "desc": TextEditingController(text: "description"),
      });
    });

    context.read<ProfileSetupProvider>().updateSavingsGoals(
      savingsGoalsData: _buildSavingsGoalsDataList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
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
                "Savings Goals (optional)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                "What are you saving for?",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              ..._buildCardSavingsGoalsInput(),
              const SizedBox(height: 10),
              CustomCardContainer(
                isShadow: false,
                isBorder: true,
                widthContainer: double.infinity,
                onTapCard: () {
                  _addFieldSavingsGoals();
                },
                childContainer: const Text(
                  "Add Another Goal",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
