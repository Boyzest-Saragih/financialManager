import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class FinalSetup extends StatelessWidget {
  const FinalSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CustomCardContainer(
              isShadow: false,
              cardColor: Colors.green,
              childContainer: Icon(
                Icons.check_circle_outline,
                size: 34,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Final Preferences",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Almost done! Just a few more settings",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}