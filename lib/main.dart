import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_task/controller/product_controller.dart';
import 'package:my_task/myApp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Get.put(ProductController());
  runApp(MyApp());
}
