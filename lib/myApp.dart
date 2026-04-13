import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_task/controller/product_controller.dart';
import 'package:my_task/view/splash_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
