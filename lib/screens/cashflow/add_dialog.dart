import 'package:financemanager/models/monthly_expense_model.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:financemanager/widgets/custom/custom_dropdown_field.dart';
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

  final TextEditingController _amountCtr = TextEditingController();
  final TextEditingController _descCtr = TextEditingController();

  int? amount;
  String? desc;

  final List<String> _typeItems = ["Income", "Expense"];
  List<String>? _CategoryItems;
  String? _selectedType;
  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    final datas = context.read<List<MonthlyExpenseItem>>();
    _CategoryItems = datas.map((e) => e.title).toList();
  }

  @override
  Widget build(BuildContext context) {
    if (_CategoryItems == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "New Transaction",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 🔽 Type Dropdown
              CustomDropdownField(
                judul: "Type",
                hint: "Income or Expense",
                value: _selectedType,
                items: _typeItems,
                onChanged: (value) {
                  setState(() => _selectedType = value);
                },
              ),

              const SizedBox(height: 16),

              // 💰 Amount Field
              CustomTextField(
                controller: _amountCtr,
                judul: "Amount",
                hint: "0",
                isNumber: true,
                borderColor: Colors.grey,
                onChangedField: (value) {
                  setState(() {
                    amount = int.tryParse(value) ?? 0;
                  });
                },
              ),

              const SizedBox(height: 16),

              // 📝 Description Field
              CustomTextField(
                controller: _descCtr,
                judul: "Description",
                hint: "Coffee, Salary, etc",
                borderColor: Colors.grey,
                onChangedField: (value) {
                  setState(() {
                    desc = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // 🏷 Category Dropdown
              CustomDropdownField(
                judul: "Category",
                hint: "Select category",
                value: _selectedCategory,
                items: _CategoryItems!,
                onChanged: (value) {
                  setState(() => _selectedCategory = value);
                },
              ),

              const SizedBox(height: 24),

              // 💾 Button
              CustomCardContainer(
                onTapCard: () {
                  print("Add transaction");
                  Navigator.pop(context);
                },
                isShadow: false,
                cardColor: Colors.blue,
                widthContainer: double.infinity,
                borderRadius: 10,
                childContainer: const Text(
                  "Add Transaction",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
