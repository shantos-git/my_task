import 'package:flutter/material.dart';
import 'package:my_task/view/language_screen.dart';
import 'package:my_task/widgets/reusable/custom_button.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Maps.png'),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                'Enable Location',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                  'Kindly allow us to access your location to\nprovide you with suggestions for nearby\nsalons',
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomButton(text: 'Enable', onPressed: () {}),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LanguageScreen(),
                    ),
                  );
                },
                child: Text(
                  'Skip, Not Now',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
