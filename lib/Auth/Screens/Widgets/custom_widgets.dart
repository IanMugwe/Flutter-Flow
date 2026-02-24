import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: const Color(0xFF5C4A2A),
          width: 1,
        ),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isPassword && _obscureText,
        keyboardType: widget.keyboardType,
        style: const TextStyle(
          color: Color(0xFFE5D5B7),
          fontSize: 15,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: const Color(0xFFB8A06A).withOpacity(0.5),
            fontSize: 15,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: const Color(0xFFB8A06A),
            size: 20,
          ),
          suffixIcon: widget.isPassword
              ? IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFFB8A06A),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFFE5D5B7),
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: value ? const Color(0xFFFFB800) : Colors.transparent,
          border: Border.all(
            color: value ? const Color(0xFFFFB800) : const Color(0xFF5C4A2A),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 14,
                color: Color(0xFF2C1810),
              )
            : null,
      ),
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFFFFB800),
            Color(0xFFFF8800),
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFB800).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(28),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C1810),
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SocialDivider extends StatelessWidget {
  const SocialDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  const Color(0xFF5C4A2A).withOpacity(0.5),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'or continue with',
            style: TextStyle(
              color: const Color(0xFFB8A06A).withOpacity(0.7),
              fontSize: 13,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF5C4A2A).withOpacity(0.5),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SocialButton(
            icon: 'assets/google_icon.png', // Add Google icon
            label: 'Google',
            onPressed: () {
              // Handle Google sign in
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _SocialButton(
            icon: 'assets/apple_icon.png', // Add Apple icon
            label: 'Apple',
            onPressed: () {
              // Handle Apple sign in
            },
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onPressed;

  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: const Color(0xFF5C4A2A),
          width: 1,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon placeholder (replace with actual icon)
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: label == 'Google'
                      ? Colors.white
                      : const Color(0xFF1877F2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    label == 'Google' ? 'G' : 'f',
                    style: TextStyle(
                      color: label == 'Google'
                          ? Colors.red
                          : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                label,
                style: const TextStyle(
                  color: Color(0xFFE5D5B7),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}