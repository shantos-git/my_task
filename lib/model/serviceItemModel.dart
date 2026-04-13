import 'package:flutter/material.dart';

class ServiceItem {
  String? title;
  String? category;
  String? price;
  IconData? iconData;
  Color? color;
  bool inStock;

  ServiceItem({
    required this.title,
    required this.category,
    required this.price,
    required this.iconData,
    required this.color,
    required this.inStock,
  });
}
