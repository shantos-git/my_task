import 'dart:convert';

import 'package:http/http.dart' as http;

class GetProduct {
  Future<Map<String, dynamic>> fetchProducts(String token) async {
    final response = await http.get(
      Uri.parse('https://product-management3-amber.vercel.app/api/v1/products'),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }
}
