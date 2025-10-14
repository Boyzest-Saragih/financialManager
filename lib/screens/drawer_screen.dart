import 'package:financemanager/screens/cashflow/cash_flow_screen.dart';
import 'package:financemanager/screens/chat/chat_screen.dart';
import 'package:financemanager/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CashFlowScreen(),
    ChatScreen(),
    Placeholder(), // Ganti dengan ScanScreen()
    Placeholder(), // Ganti dengan ScanScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("FinTrack Menu", style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            ),
          ],
        ),
      ),

      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.money_sharp), label: "Cash Flow"),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "AI Chat"),
          BottomNavigationBarItem(icon: Icon(Icons.archive_rounded), label: "Savings"),
          BottomNavigationBarItem(icon: Icon(Icons.scanner), label: "AI Scan"),
        ],
      ),
    );
  }
}
