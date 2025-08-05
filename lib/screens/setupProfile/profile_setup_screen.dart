import 'package:financemanager/providers/profile_setup_provider.dart';
import 'package:financemanager/screens/setupProfile/monthly_expenses_input.dart';
import 'package:financemanager/screens/setupProfile/savings_goals_Setup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_snackbar.dart';
import 'package:financemanager/screens/setupProfile/current_balance_input.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final List<Widget> _setupPages = [
    const SavingsGoalsSetup(),
    const CurrentBalanceInput(),
    const MonthlyExpensesInput(),
    const Text("Halaman Ketiga: Tujuan Anggaran (placeholder)"),
    const Text("Halaman Keempat: Tinjau & Konfirmasi (placeholder)"),
  ];

  @override
  Widget build(BuildContext context) {
    final setupFlowProvider = context.watch<ProfileSetupProvider>();
    final int currentStep = setupFlowProvider.currentStep;

    final int clampedIndex = (currentStep - 1).clamp(0, _setupPages.length - 1);
    final Widget currentPage = _setupPages[clampedIndex];

    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            height: 100,
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "FinTrack Setup",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "Step ${currentStep!} of ${_setupPages.length}",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0,
                      disabledThumbRadius: 0,
                    ),
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    activeColor: Colors.blue,
                    value: currentStep.toDouble(),
                    min: 0,
                    max: _setupPages.length.toDouble(),
                    onChanged: (v){},
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              height: double.infinity,
              padding: const EdgeInsets.all(10),
              child: currentPage,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomCardContainer(
              onTapCard:
                  (currentStep == 1)
                      ? null
                      : () {
                        context.read<ProfileSetupProvider>().goToPreviousStep();
                      },
              widthContainer: 80,
              isShadow: false,
              cardColor: (currentStep == 1) ? Colors.grey[300]! : Colors.white,
              childContainer:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 16,
                      color: (currentStep == 1) ? Colors.grey : Colors.black,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "Back",
                      style: TextStyle(
                        color: (currentStep == 1) ? Colors.grey : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

            CustomCardContainer(
              onTapCard: () async {
                bool canProceed = await context
                    .read<ProfileSetupProvider>()
                    .continueStep(context, _setupPages.length);
                if (!canProceed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    CustomSnackBar(
                      message: "Tolong semua field di isi",
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              widthContainer: 106,
              isShadow: false,
              cardColor: Colors.blue,
              childContainer: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Continue", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, size: 16, color: Colors.white),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
