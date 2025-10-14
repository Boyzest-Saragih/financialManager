import 'package:financemanager/models/monthly_expense_model.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDialog extends StatefulWidget {
  const AddDialog({super.key});

  @override
  State<AddDialog> createState() => _AddDialogState();
}

class _AddDialogState extends State<AddDialog> {
  late List<MonthlyExpenseItem> datas;

  TextEditingController _amountCtr = TextEditingController();
  TextEditingController _descCtr = TextEditingController();

  final List<String> _typeItems = ["Income", "Expense"];
  List<String>? _CategoryItems;

  int? amount;
  String? desc;

  @override
  void initState() {
    datas = context.watch<List<MonthlyExpenseItem>>();
    setState(() {
      _CategoryItems =
          datas.map((e) {
            return e.title;
          }).toList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "New Transaction",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.close),
                ),
              ],
            ),
            SizedBox(height: 16),

            Text(
              "Type",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            CustomTextField(
              controller: _amountCtr,
              judul: "Amount",
              hint: "0",
              isNumber: true,
              borderColor: Colors.grey,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
