import 'package:flutter/material.dart';

class CustomCardContainer extends StatelessWidget {
  final Widget childContainer;
  final Color cardColor;
  final double? widthContainer;
  final bool isShadow;
  final bool isBorder;
  const CustomCardContainer({
    super.key,
    required this.childContainer,
    this.cardColor = Colors.white,
    this.widthContainer,
    this.isShadow = true,
    this.isBorder = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: widthContainer,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(15),
        border: isBorder?Border.all(width: 1, color: Colors.grey.withOpacity(0.5)):Border(),
        boxShadow: [
          BoxShadow(
            color: isShadow?Colors.black.withOpacity(0.2):Colors.black.withOpacity(0.01),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: childContainer,
    );
  }
}
