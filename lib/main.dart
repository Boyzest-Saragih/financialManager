import 'package:financemanager/firebase_options.dart';
import 'package:financemanager/providers/financial_summary_provider.dart';
import 'package:financemanager/providers/profile_setup_provider.dart';
import 'package:financemanager/screens/auth/register_screen.dart';
import 'package:financemanager/screens/cashflow/cash_flow_screen.dart';
import 'package:financemanager/screens/drawer_screen.dart';
import 'package:financemanager/screens/setupProfile/profile_setup_screen.dart';
import 'package:financemanager/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> ProfileSetupProvider()),
        ChangeNotifierProvider(create: (_)=> FinancialSummaryProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: 
      const CashFlowScreen()
      // const Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData) {
          return const RegisterScreen();
        }

        return FutureBuilder<bool?>(
          future: AuthServices().getIsSetupProfile(),
          builder: (context, profileSnapshot) {
            if (profileSnapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (profileSnapshot.data == false) {
              return const ProfileSetupScreen();
            }

            return const DrawerScreen();
          },
        );
      },
    );
  }
}
