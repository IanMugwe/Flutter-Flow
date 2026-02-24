import 'package:flutter/material.dart';
import 'package:flutter_flow/Auth/Screens/Widgets/custom_widgets.dart';
import 'package:flutter_flow/Auth/Screens/forgot_password_page.dart';

class AuthBottomSheet extends StatefulWidget {
  final bool isLogin;

  const AuthBottomSheet({super.key, required this.isLogin});

  @override
  State<AuthBottomSheet> createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet>
    with SingleTickerProviderStateMixin {
  late bool _isLogin;
  late TabController _tabController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _rememberMe = false;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: _isLogin ? 0 : 1,
    );
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          _isLogin = _tabController.index == 0;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.5,
          colors: [
            const Color(0xFF8B6914),
            const Color(0xFF3D2F0F),
            const Color(0xFF1A1508),
          ],
          stops: const [0.0, 0.5, 1.0],
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.92,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  // Drag Handle
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Logo
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: Image.asset('assets/logo.png', fit: BoxFit.contain),
                  ),
                  const SizedBox(height: 8),
                  ShaderMask(
                    shaderCallback: (bounds) => LinearGradient(
                      colors: [
                        const Color(0xFFFFB800),
                        const Color(0xFFFF8800),
                      ],
                    ).createShader(bounds),
                    child: const Text(
                      'Event App',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Tab Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: const Color(0xFF5C4A2A),
                          width: 1,
                        ),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        indicator: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFB800),
                              const Color(0xFFFF8800),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFB800).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        labelColor: const Color(0xFF2C1810),
                        unselectedLabelColor: const Color(0xFFB8A06A),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.5,
                        ),
                        tabs: const [
                          Tab(text: 'Log In'),
                          Tab(text: 'Sign Up'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Form Content
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: _isLogin ? _buildLoginForm() : _buildSignUpForm(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoginForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(text: 'Email'),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _emailController,
          hintText: 'davidjohnson@gmail.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        const SectionLabel(text: 'Password'),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _passwordController,
          hintText: '••••••••',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CustomCheckbox(
                  value: _rememberMe,
                  onChanged: (value) {
                    setState(() {
                      _rememberMe = value ?? false;
                    });
                  },
                ),
                const SizedBox(width: 8),
                const Text(
                  'Remember me',
                  style: TextStyle(color: Color(0xFFB8A06A), fontSize: 14),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordPage(),
                  ),
                );
              },
              child: const Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Color(0xFFFF6B6B),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        PrimaryButton(
          text: 'Log In',
          onPressed: () {
            // Handle login
          },
        ),
        const SizedBox(height: 24),
        const SocialDivider(),
        const SizedBox(height: 24),
        const SocialButtons(),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(text: 'Full Name'),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _nameController,
          hintText: 'David Johnson',
          prefixIcon: Icons.person_outline,
        ),
        const SizedBox(height: 20),
        const SectionLabel(text: 'Email Address'),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _emailController,
          hintText: 'davidjohnson@gmail.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 20),
        const SectionLabel(text: 'Enter Password'),
        const SizedBox(height: 8),
        CustomTextField(
          controller: _passwordController,
          hintText: '••••••••',
          prefixIcon: Icons.lock_outline,
          isPassword: true,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CustomCheckbox(
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() {
                  _agreeToTerms = value ?? false;
                });
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: RichText(
                text: const TextSpan(
                  text: 'I agree to the ',
                  style: TextStyle(color: Color(0xFFB8A06A), fontSize: 13),
                  children: [
                    TextSpan(
                      text: 'Terms & Conditions',
                      style: TextStyle(
                        color: Color(0xFFFFB800),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFFFFB800),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        PrimaryButton(
          text: 'Sign Up',
          onPressed: () {
            // Handle sign up
          },
        ),
        const SizedBox(height: 24),
        const SocialDivider(),
        const SizedBox(height: 24),
        const SocialButtons(),
        const SizedBox(height: 40),
      ],
    );
  }
}
