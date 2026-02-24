import 'package:flutter/material.dart';
import 'Auth/Screens/auth_bottom_sheet.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.topCenter,
            radius: 1.2,
            colors: [
              const Color(0xFF8B6914),
              const Color(0xFF3D2F0F),
              const Color(0xFF1A1508),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),
              // Logo Section
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.3),
                        blurRadius: 30,
                        spreadRadius: 10,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/logo.png', // Add your logo here
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [const Color(0xFFFFB800), const Color(0xFFFF8800)],
                ).createShader(bounds),
                child: const Text(
                  'Event App',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 4),
                        blurRadius: 8,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(flex: 3),
              // Bottom Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    // _buildActionButton(
                    //   context,
                    //   'Log In',
                    //   () => _showAuthBottomSheet(context, isLogin: true),
                    //   isPrimary: false,
                    // ),
                    // const SizedBox(height: 16),
                    _buildActionButton(
                      context,
                      'Get Started',
                      () => _showAuthBottomSheet(context, isLogin: true),
                      isPrimary: true,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String text,
    VoidCallback onPressed, {
    required bool isPrimary,
  }) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: isPrimary
            ? LinearGradient(
                colors: [const Color(0xFFFFB800), const Color(0xFFFF8800)],
              )
            : null,
        color: isPrimary ? null : Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        border: isPrimary
            ? null
            : Border.all(color: const Color(0xFFFFB800), width: 2),
        boxShadow: isPrimary
            ? [
                BoxShadow(
                  color: const Color(0xFFFFB800).withOpacity(0.4),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(28),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isPrimary
                    ? const Color(0xFF2C1810)
                    : const Color(0xFFFFB800),
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAuthBottomSheet(BuildContext context, {required bool isLogin}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AuthBottomSheet(isLogin: isLogin),
    );
  }
}
