import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_task/model/ProductsModel.dart';

class RegisterServices {
  final String baseUrl =
      'https://product-management-seven-xi.vercel.app/api/v1/users/register';

  Future<Map<String, dynamic>> register(
      String name, String email, String password, String? fcmToken) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': name,
        'email': email,
        'password': password,
        'fcmToken': fcmToken ?? 'optional-fcm-token',
      }),
    );

    if (response.statusCode == 201) {
      final Data = jsonDecode(response.body);
      return Data;
    } else {
      return throw Exception(
          'Failed to register: ${response.statusCode} - ${response.body}');
    }
  }
}
