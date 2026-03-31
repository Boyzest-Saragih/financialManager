import 'package:financemanager/utils/idr_currency.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class BannerProgress extends StatefulWidget {
  const BannerProgress({super.key});

  @override
  State<BannerProgress> createState() => _BannerProgressState();
}

class _BannerProgressState extends State<BannerProgress> {
  @override
  Widget build(BuildContext context) {
    return CustomCardContainer(
      isShadow: false,
        widthContainer: 400,
        isBorder: true,
        cardColor: const Color.fromARGB(255, 174, 232, 255),
        childContainer: Column(
          children: [
            Text("Total Progress"),
            Text("Rp. ${IdrCurrency.format(59000)}"),
            Text("of Rp. ${IdrCurrency.format(90000)} across 4 goals"),
      
            Slider(value: 50, onChanged: (v) {}, min: 0, max: 100),
            Text("16.8% towards all goals"),
          ],
        ),
      
    );
  }
}
