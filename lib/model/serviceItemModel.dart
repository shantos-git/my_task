import 'package:flutter/material.dart';

class ServiceItem {
  String title;
  String category;
  String price;
  IconData iconData;
  Color color;
  bool inStock;
  String subtitle;
  String discount;
  String brand;
  String weight;
  String dimensions;
  String status;
  List<String> tags;
  String description;

  ServiceItem({
    required this.title,
    required this.category,
    required this.price,
    required this.iconData,
    required this.color,
    required this.inStock,
    this.subtitle = '',
    this.discount = '',
    this.brand = '',
    this.weight = '',
    this.dimensions = '',
    this.status = 'active',
    this.tags = const [],
    this.description = '',
  });
}
