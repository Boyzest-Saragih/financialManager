import 'package:financemanager/services/auth_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final auth = AuthServices();
  @override
  Widget build(BuildContext context) {
  final user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${user!.email}"),
      ),
    );
  }
}