import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_task/view/signUp_screen.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';

class SignupVerifyScreen extends StatefulWidget {
  const SignupVerifyScreen({super.key});

  @override
  State<SignupVerifyScreen> createState() => _SignupVerifyScreenState();
}

class _SignupVerifyScreenState extends State<SignupVerifyScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  Timer? _timer;
  int _secondsRemaining = 60;
  String _errorMessage = '';
  String _statusMessage = '';
  static const String _correctOtp = '1234';

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    for (final controller in _otpControllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _secondsRemaining = 60;
      _statusMessage = '';
      _errorMessage = '';
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
        _sendNewOtp();
        return;
      }
      setState(() {
        _secondsRemaining--;
      });
    });
  }

  void _onOtpChanged(String value, int index) {
    if (value.length > 1) {
      value = value.substring(value.length - 1);
      _otpControllers[index].text = value;
      _otpControllers[index].selection = TextSelection.fromPosition(
        TextPosition(offset: _otpControllers[index].text.length),
      );
    }

    if (value.isNotEmpty && index < _focusNodes.length - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }

    if (_otpControllers.every((controller) => controller.text.isNotEmpty)) {
      _verifyOtp();
    }
  }

  void _verifyOtp() {
    final enteredOtp = _otpControllers.map((c) => c.text).join();
    if (enteredOtp.length < 4) return;

    if (enteredOtp == _correctOtp) {
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              icon: SizedBox(
                height: 180,
                width: 180,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/images/Success.png',
                      height: 150,
                      width: 150,
                    ),
                    Positioned(
                      top: 60,
                      left: 30,
                      child: Image.asset('assets/images/star.png',
                          width: 10, height: 10, color: Colors.blue),
                    ),
                    Positioned(
                      top: 60,
                      right: 20,
                      child: Image.asset('assets/images/star.png',
                          width: 20, height: 20, color: Colors.blue),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Image.asset('assets/images/star.png',
                          width: 24, height: 24, color: Colors.blue),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 30,
                      child: Image.asset('assets/images/star.png',
                          width: 8, height: 8, color: Colors.blue),
                    ),
                    Positioned(
                      top: 20,
                      left: 200,
                      child: Image.asset('assets/images/star.png',
                          width: 5, height: 5, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              title: const Text(
                'Successfully Registered',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              content: const Text(
                'Your account has been registered\nsuccessfully, now let’s enjoy our features!',
                textAlign: TextAlign.center,
              ),
              actions: [CustomButton(text: 'Continue', onPressed: () {})],
            );
          });
    } else {
      setState(() {
        _errorMessage = 'Invalid OTP. Please try again.';
      });
    }
  }

  void _sendNewOtp() {
    _clearOtpFields();
    setState(() {
      _statusMessage = 'A new OTP has been sent automatically.';
    });
    _startTimer();
  }

  void _clearOtpFields() {
    for (final controller in _otpControllers) {
      controller.clear();
    }
    _focusNodes.first.requestFocus();
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
            children: [
              Text('Verify Code',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Please enter the code we just sent to\nemail pristia@gmail.com',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return SizedBox(
                    width: 60,
                    height: 60,
                    child: TextField(
                      controller: _otpControllers[index],
                      focusNode: _focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      obscureText: true,
                      obscuringCharacter: '•',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onChanged: (value) => _onOtpChanged(value, index),
                    ),
                  );
                }),
              ),
              if (_errorMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  _errorMessage,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ],
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(
                'Resend code in 00:${_secondsRemaining.toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 14),
              ),
              if (_statusMessage.isNotEmpty) ...[
                const SizedBox(height: 12),
                Text(
                  _statusMessage,
                  style: const TextStyle(fontSize: 12, color: Colors.green),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
