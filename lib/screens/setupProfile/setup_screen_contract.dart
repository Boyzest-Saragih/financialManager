import 'package:flutter/material.dart';

typedef OnContinueCallback = Future <bool> Function();

typedef OnBackCallback = VoidCallback;

abstract class SetupScreenContract {
  Widget buildPage(BuildContext context);

  OnContinueCallback getOnContinueCallback(BuildContext context);

  OnBackCallback? getOnBackCallback(BuildContext context);
}