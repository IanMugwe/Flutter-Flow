import 'package:flutter/material.dart';
import 'package:flutter_flow/Auth/Screens/Widgets/custom_widgets.dart';

class EnterCodePage extends StatefulWidget {
  final String email;
  const EnterCodePage({super.key, required this.email});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final List<TextEditingController> _codeControllers = List.generate(
    4,
    (_) => TextEditingController(),
  );

  @override
  void dispose() {
    for (var controller in _codeControllers) {
      controller.dispose();
    }
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
                  'Enter code Here',
                  style: TextStyle(
                    color: Colors.blue.shade700,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Please enter the code we just sent to email\n${widget.email}',
                  style: const TextStyle(
                    color: Color(0xFFB8A06A),
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return SizedBox(
                      width: 50,
                      child: TextField(
                        controller: _codeControllers[index],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        maxLength: 1,
                        decoration: InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Handle request code
                    },
                    child: const Text(
                      'Request code',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                PrimaryButton(
                  text: 'Continue Code',
                  onPressed: () {
                    // Handle code verification
                  },
                ),
                const SizedBox(height: 24),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Already have an account? Log in',
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
