import 'package:financemanager/screens/setupProfile/setup_screen_contract.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_snackbar.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';

class CurrentBalanceInput extends StatefulWidget
    implements SetupScreenContract {
  const CurrentBalanceInput({super.key});

  @override
  State<CurrentBalanceInput> createState() => _CurrentBalanceInputState();

  @override
  Widget buildPage(BuildContext context) => this;

  @override
  OnContinueCallback getOnContinueCallback(BuildContext context) {
    // TODO: implement getOnContinueCallback
    return () async {
      final _CurrentBalanceInputState? state =
          context.findAncestorStateOfType<_CurrentBalanceInputState>();

      if (state != null) {
        if (state.currBalance.isEmpty || state.monthlyIncome.isEmpty) {
          print("ISI VAR KSOSNG");
          ScaffoldMessenger.of(context).showSnackBar(
            CustomSnackBar(
              message: "Tolong semua field di isi",
              backgroundColor: Colors.red,
            ),
          );
          return false;
        }
        print("${state.currBalance} & ${state.monthlyIncome}");
        return true;
      }
      print("ISI state KSOSNG");

      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(
          message: "Tolong semua field di isi",
          backgroundColor: Colors.red,
        ),
      );
      return false;
    };
  }

  @override
  OnBackCallback? getOnBackCallback(BuildContext context)=>null;
}

class _CurrentBalanceInputState extends State<CurrentBalanceInput> {
  TextEditingController _currBalanceCtr = TextEditingController();
  TextEditingController _monthlyIncomeCtr = TextEditingController();

  late String currBalance = '';
  late String monthlyIncome = '';
  

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

        const Text(
          "We need your data current financial overview",
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
            setState(() {
              currBalance = value;
              print(currBalance);
            });
          },
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _monthlyIncomeCtr,
          hint: "5000",
          judul: "Monthly Income",
          isNumber: true,
          onChangedField: (value) {
            setState(() {
              monthlyIncome = value;
            });
          },
        ),
      ],
    );
  }
}
