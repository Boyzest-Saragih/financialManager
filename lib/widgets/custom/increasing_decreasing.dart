import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class IncreasingDecreasing extends StatefulWidget {
  final double used;
  final double valueExpenses;
  const IncreasingDecreasing({
    super.key,
    required this.used,
    required this.valueExpenses,
  });

  @override
  State<IncreasingDecreasing> createState() => _IncreasingDecreasingState();
}

class _IncreasingDecreasingState extends State<IncreasingDecreasing> {
  late bool isIncrease = false;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.used > widget.valueExpenses) {
      setState(() {
        isIncrease = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      isShadow: false,
      isBorder: true,
      borderColor: Colors.grey,
      padding: 2,
      borderRadius: 10,
      childContainer:
          isIncrease
              ? Row(
                children: [
                  const Icon(LucideIcons.trendingUp, size: 16),
                  const SizedBox(width: 4),
                  const Text("Increaseing", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              )
              : Row(
                children: [
                  const Icon(LucideIcons.trendingDown, size: 16),
                  const SizedBox(width: 4),
                  const Text("Decreasing",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ],
              ),
    );
  }
}
