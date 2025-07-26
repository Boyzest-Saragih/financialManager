import 'package:financemanager/screens/home/home_screen.dart';
import 'package:financemanager/screens/auth/register_screen.dart';
import 'package:financemanager/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:financemanager/services/auth_services.dart';
import 'package:financemanager/widgets/custom_button.dart';
import 'package:financemanager/widgets/custom_textField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                "Welcome back to your financial journey",
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
                      "Sign In",
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
                      title: "Login",
                      onPress: () async {
                        try {
                          await auth.login(emailCtr.text, passCtr.text);

                          if (!mounted) return;

                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              message: "Registration successful!",
                              backgroundColor: Colors.green,
                              icon: Icons.check_circle_outline,
                            ),
                          );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomeScreen(),
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
                    const SizedBox(height: 12),
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("Forgot your password?"),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Colors.grey)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("OR CONTINUE WITH"),
                        ),
                        const Expanded(child: Divider(color: Colors.grey)),
                      ],
                    ),
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
                          const Text("Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (BuildContext context) =>
                                          RegisterScreen(),
                                ),
                                ModalRoute.withName("/"),
                              );
                            },
                            child: const Text("Sign up"),
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
