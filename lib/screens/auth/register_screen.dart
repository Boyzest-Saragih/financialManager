import 'package:financemanager/screens/auth/login_screen.dart';
import 'package:financemanager/screens/setupProfile/profile_setup_screen.dart';
import 'package:financemanager/services/auth_services.dart';
import 'package:financemanager/widgets/custom/custom_button.dart';
import 'package:financemanager/widgets/custom/custom_snackbar.dart';
import 'package:financemanager/widgets/custom/custom_textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailCtr = TextEditingController();
  final passCtr = TextEditingController();
  final auth = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Financial Manager",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Welcome to your financial journey",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(controller: emailCtr, hint: "Email"),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: passCtr,
                      hint: "Password",
                      obscure: true,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      title: "Register",
                      onPress: () async {
                        try {
                          await auth.register(emailCtr.text, passCtr.text);
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              message: "Registration successful!",
                              backgroundColor: Colors.green,
                              icon: Icons.check_circle_outline,
                            ),
                          );
                          await auth.login(emailCtr.text, passCtr.text);
                          if (!mounted) return;

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => ProfileSetupScreen(),
                            ),
                            ModalRoute.withName("/"),
                          );
                        } on FirebaseAuthException catch (e) {
                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              message: e.message ?? "Something went wrong.",
                              backgroundColor: Colors.red,
                              icon: Icons.error_outline,
                            ),
                          );
                        }
                      },
                    ),

                    // Adjusted spacing to match LoginScreen
                    const SizedBox(height: 12),
                    Row(
                      children: const [
                        // Removed thickness to match LoginScreen
                        Expanded(
                          child: Divider(color: Colors.grey),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("OR CONTINUE WITH"),
                        ),
                        // Removed thickness to match LoginScreen
                        Expanded(
                          child: Divider(color: Colors.grey),
                        ),
                      ],
                    ),
                    // Adjusted spacing to match LoginScreen
                    const SizedBox(height: 12),
                    CustomButton(
                      title: "Continue with Google",
                      onPress: () {},
                      colorBack: const Color(0xFFE6E6E6),
                      colorFront: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      title: "Continue with Apple",
                      onPress: () {},
                      colorBack: const Color(0xFFE6E6E6),
                      colorFront: Colors.black,
                    ),

                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (BuildContext context) => LoginScreen(),
                                ),
                                ModalRoute.withName("/"),
                              );
                            },
                            child: const Text("Sign in"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}