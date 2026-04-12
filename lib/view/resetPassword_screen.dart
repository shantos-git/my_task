import 'package:flutter/material.dart';
import 'package:my_task/view/resetPassVerify_screen.dart';

import 'package:my_task/widgets/reusable/custom_button.dart';
import 'package:my_task/widgets/reusable/custom_textformField.dart';

class ResetpasswordScreen extends StatefulWidget {
  const ResetpasswordScreen({super.key});

  @override
  State<ResetpasswordScreen> createState() => _ResetpasswordScreenState();
}

class _ResetpasswordScreenState extends State<ResetpasswordScreen> {
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
            children: [
              Text('Reset Password',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                'Your password must be at least 8 characters\nlong and include a combination of letters,\nnumbers',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              CustomTextformfield(
                labelText: 'New Password',
                hintText: 'Enter your new password',
                keyboardType: TextInputType.emailAddress,
                suffixIcon: Icons.visibility_outlined,
              ),
              CustomTextformfield(
                labelText: 'Confirm Password',
                hintText: 'Confirm your new password',
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: Icons.visibility_outlined,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              CustomButton(
                text: 'Submit',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ResetpassverifyScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
