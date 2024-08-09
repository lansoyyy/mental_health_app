import 'package:flutter/material.dart';
import 'package:mental_health_app/screens/initial_home_screen.dart';

import '../../widgets/button_widget.dart';
import '../../widgets/text_widget.dart';
import '../../widgets/textfield_widget.dart';
import '../home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Logo Placeholder
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                ),
                const SizedBox(
                  height: 10,
                ),

                const Text(
                  'Mental Health\nApplication',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  hasValidator: false,
                  hint: 'Enter Student Id',
                  borderColor: Colors.grey,
                  label: 'Student Id',
                  controller: email,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a Student Id';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFieldWidget(
                  hasValidator: false,
                  hint: 'Enter password',
                  showEye: true,
                  borderColor: Colors.grey,
                  label: 'Password',
                  isObscure: true,
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 30),
                ButtonWidget(
                  label: 'Login',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const InitialHomeScreen()));
                  },
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
