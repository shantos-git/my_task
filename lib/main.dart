import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_task/myApp.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}
