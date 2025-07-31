import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';

class CurrentBalanceInput extends StatefulWidget {
  const CurrentBalanceInput({super.key});

  @override
  State<CurrentBalanceInput> createState() => _CurrentBalanceInputState();
}

class _CurrentBalanceInputState extends State<CurrentBalanceInput> {
  TextEditingController _currBalance = TextEditingController();
  TextEditingController _monthlyIncome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCardContainer(
          isBorder: false,
          isShadow: false,
          cardColor: Colors.blue,
          childContainer: Icon(
            Icons.attach_money,
            color: Colors.white,
            size: 36,
          ),
        ),

        const SizedBox(height: 10),

        const Text("We need your data current financial overview"),
        const SizedBox(height: 40),
        CustomTextField(controller: _currBalance, hint: "Current Balance"),
        const SizedBox(height: 20),
        CustomTextField(controller: _monthlyIncome, hint: "Monthly Income"),
      ],
    );
  }
}
