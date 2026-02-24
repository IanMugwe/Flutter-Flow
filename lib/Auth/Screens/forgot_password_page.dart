import 'package:flutter/material.dart';
import 'package:flutter_flow/Auth/Screens/Widgets/custom_widgets.dart';
import 'package:flutter_flow/Auth/Screens/create_new_password_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Enter your email address and we'll guide you through resetting your password safely.",
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 30),
                const SectionLabel(text: 'Email'),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _emailController,
                  hintText: 'michaljacksan@gmail.com',
                  prefixIcon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Continue',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const CreateNewPasswordPage(email: '',)));
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back to Login',
                      style: TextStyle(
                        color: Color(0xFFB8A06A),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
