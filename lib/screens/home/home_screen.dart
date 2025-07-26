// import 'package:financemanager/services/auth_services.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    // final user = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "FinTrack",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, size: 30),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    Icon(Icons.circle, size: 16, color: Colors.red),
                    Text(
                      "2",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.dark_mode, size: 30),
            onPressed: () {},
          ),
        ],
      ),

      body: Container(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Evening! 👋", style: TextStyle(fontSize: 30)),
            Text("Saturday, July 26"),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF3D83F6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Total Balance",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Rp 500.000,00",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.trending_up, color: Colors.white),
                      SizedBox(width: 5),
                      Text(
                        "+12.5% from last month",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  width: 150,
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Column(
                    children: [
                      Icon(Icons.attach_money),
                      const SizedBox(height: 5  ,),
                      Text("+Rp 100.000"),
                      Text("Monthly Profit"),
                      Text("+15% vs last month")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(12),
                  width: 150,
                  decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Column(
                    children: [
                      Icon(Icons.arrow_back_ios),
                      Text("+Rp 100.000"),
                      Text("Monthly Profit"),
                      Text("+15% vs last month")
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const Text("data"),
            const Text("data"),
            const Text("data"),
            const Text("data"),
          ],
        ),
      ),
    );
  }
}
