import 'package:financemanager/firebase_options.dart';
import 'package:financemanager/providers/profile_setup_provider.dart';
import 'package:financemanager/screens/drawer_screen.dart';
import 'package:financemanager/screens/setupProfile/profile_setup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform
  // );

  runApp(ChangeNotifierProvider(
    create: (context)=> ProfileSetupProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FinTrack',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade100,
        primaryColor: const Color(0xFFF9FAFB),
      ),
      home: ProfileSetupScreen(),
    );
  }
}
