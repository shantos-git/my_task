import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart';
import 'package:my_task/services/RegisterServices.dart';

import 'package:my_task/view/home_screen.dart';
import 'package:my_task/view/signIn_screen.dart';
import 'package:my_task/view/signUp_verify_screen.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';
import 'package:my_task/widgets/reusable/custom_textformField.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int _passwordStrength = 0;
  String _passwordStrengthLabel = 'Too weak';
  bool _isLoading = false;
  RegisterServices _registerServices = RegisterServices();

  @override
  void dispose() {
    _passwordController.dispose();
    _email.dispose();
    _name.dispose();

    super.dispose();
  }

  void _updatePasswordStrength(String password) {
    int strength = 0;
    if (password.length >= 8) strength++;
    if (RegExp(r'(?=.*[A-Z])').hasMatch(password)) strength++;
    if (RegExp(r'(?=.*[0-9])').hasMatch(password)) strength++;
    if (RegExp(r'(?=.*[!@#\$%^&*(),.?":{}|<>])').hasMatch(password)) strength++;

    setState(() {
      _passwordStrength = strength;
      if (strength <= 1) {
        _passwordStrengthLabel = 'Weak';
      } else if (strength == 2) {
        _passwordStrengthLabel = 'Fair';
      } else if (strength == 3) {
        _passwordStrengthLabel = 'Good';
      } else {
        _passwordStrengthLabel = 'Strong';
      }
    });
  }

  Future<void> _handleSignUp() async {
    if (_email.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _name.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final result = await _registerServices.register(
          _name.text, _email.text, _passwordController.text, null);

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Account created successfully')),
      );
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed : $error'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 22,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 20),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              Navigator.of(context).maybePop();
            },
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to Eduline',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                'Let’s join to Eduline learning ecosystem & meet our professional mentor. It’s Free!',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomTextformfield(
                controller: _email,
                labelText: 'Email Address',
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
              ),
              CustomTextformfield(
                controller: _name,
                labelText: 'Full Name',
                hintText: 'Enter your full name',
                keyboardType: TextInputType.name,
              ),
              CustomTextformfield(
                labelText: 'Password',
                hintText: 'Enter your password',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                suffixIcon: Icons.visibility_outlined,
                controller: _passwordController,
                onChanged: _updatePasswordStrength,
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: _passwordStrength >= 1
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: _passwordStrength >= 2
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: _passwordStrength >= 3
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                              color: _passwordStrength >= 4
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    _passwordStrengthLabel,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: _passwordStrength >= 3 ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.green, width: 1),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 10,
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      _passwordStrength <= 1
                          ? 'Use at least 8 characters, uppercase letters, numbers and symbols.'
                          : _passwordStrength == 2
                              ? 'Add uppercase letters, numbers or symbols to improve strength.'
                              : _passwordStrength == 3
                                  ? 'Almost strong—add one more symbol or number.'
                                  : 'Great! Your password is strong and secure.',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  _isLoading ? null : _handleSignUp();
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const SigninScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
