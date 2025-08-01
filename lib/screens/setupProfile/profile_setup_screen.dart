import 'package:financemanager/screens/setupProfile/current_balance_input.dart';
import 'package:financemanager/screens/setupProfile/setup_screen_contract.dart';
import 'package:financemanager/widgets/custom/custom_card_container.dart';
import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  int slideVal = 1;
  final List<SetupScreenContract> _setupScreens = [const CurrentBalanceInput(), const CurrentBalanceInput(),const CurrentBalanceInput()];

  void _updateIncrementSlideVal() {
    setState(() {
      slideVal = (slideVal + 1).clamp(1, _setupScreens.length);
    });
  }

  void _updateDecrementSlideVal() {
    setState(() {
      slideVal = (slideVal - 1).clamp(1, _setupScreens.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    final int clampedIndex = (slideVal - 1).clamp(0, _setupScreens.length - 1);
    final SetupScreenContract currPage = _setupScreens[clampedIndex];
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            height: 80,
            alignment: Alignment.center,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "FinTrack Setup",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Step ${clampedIndex + 1} of ${_setupScreens.length}"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                    value: slideVal.toDouble(),
                    min: 0,
                    max: _setupScreens.length+1,
                    onChanged: (v) {},
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(16),
              child: currPage.buildPage(context),
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
                clampedIndex ==0?null:(){
                  final onBackCallback = currPage.getOnBackCallback(context);
                  if (onBackCallback != null) {
                    onBackCallback();
                  }
                  _updateDecrementSlideVal();
                }
              ,
              widthContainer: 80,
              isShadow: false,
              childContainer: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [Icon(Icons.arrow_back, size: 16), Text("Back")],
              ),
            ),
            CustomCardContainer(
              onTapCard: () async{
                final onContinueCallback = currPage.getOnContinueCallback(context);
                if (onContinueCallback != null) {
                  bool canProceed = await onContinueCallback();
                  if (canProceed) {
                    if (slideVal <_setupScreens.length ) {
                      _updateIncrementSlideVal();
                      print("slideVal");
                    }else{
                      print("Screen Selesai");
                      // NAvigator
                    }
                  }
                }
              },
              widthContainer: 106,
              isShadow: false,
              cardColor: Colors.blue,
              childContainer: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Continue", style: TextStyle(color: Colors.white)),
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
