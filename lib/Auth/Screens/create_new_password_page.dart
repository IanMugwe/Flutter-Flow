import 'package:flutter/material.dart';
import 'package:flutter_flow/Auth/Screens/Widgets/custom_widgets.dart';
import 'package:flutter_flow/Auth/Screens/enter_code_page.dart';

class CreateNewPasswordPage extends StatefulWidget {
  final String email;
  const CreateNewPasswordPage({super.key, required this.email});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  'Create New Password',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Create a strong 8-character password for MindTrack. Sign in to start tracking Transform your habits.',
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 30),
                const SectionLabel(text: 'Password'),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _passwordController,
                  hintText: '********',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 20),
                const SectionLabel(text: 'Confirm Password'),
                const SizedBox(height: 8),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: '********',
                  prefixIcon: Icons.lock_outline,
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                PrimaryButton(
                  text: 'Continue',
                  onPressed: () {
                    // Handle password reset
                    Navigator.push(context, MaterialPageRoute(builder: (_) => EnterCodePage(email: widget.email)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
