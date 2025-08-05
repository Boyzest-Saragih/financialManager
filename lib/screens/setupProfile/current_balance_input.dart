import 'package:financemanager/providers/profile_setup_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';

class CurrentBalanceInput extends StatefulWidget {
  const CurrentBalanceInput({super.key});

  @override
  State<CurrentBalanceInput> createState() => _CurrentBalanceInputState();
}

class _CurrentBalanceInputState extends State<CurrentBalanceInput> {
  final TextEditingController _currBalanceCtr = TextEditingController();
  final TextEditingController _monthlyIncomeCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = context.read<ProfileSetupProvider>();
    _currBalanceCtr.text = provider.currentBalance;
    _monthlyIncomeCtr.text = provider.monthlyIncome;
  }

  @override
  void dispose() {
    _currBalanceCtr.dispose();
    _monthlyIncomeCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final setupFlowProvider = context.read<ProfileSetupProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCardContainer(
          isBorder: false,
          isShadow: false,
          cardColor: Colors.blue,
          childContainer: const Icon(
            Icons.attach_money,
            color: Colors.white,
            size: 36,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "We need your current financial overview",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 40),
        CustomTextField(
          controller: _currBalanceCtr,
          hint: "100000",
          judul: "Current Balance",
          isNumber: true,
          onChangedField: (value) {
            setupFlowProvider.updateCurrentBalanceInput(
              balance: value,
              income: _monthlyIncomeCtr.text,
            );
          },
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _monthlyIncomeCtr,
          hint: "5000",
          judul: "Monthly Income",
          isNumber: true,
          onChangedField: (value) {
            setupFlowProvider.updateCurrentBalanceInput(
              balance: _currBalanceCtr.text,
              income: value,
            );
          },
        ),
      ],
    );
  }
}
