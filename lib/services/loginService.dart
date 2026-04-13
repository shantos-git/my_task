import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginService {
  Future<Map<String, dynamic>> login(
      String email, String password, String? fcmToken) async {
    final response = await http.post(
      Uri.parse(
          'https://product-management2-alpha.vercel.app/api/v1/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
        'fcmToken': fcmToken ?? 'optional-fcm-token',
      }),
    );

    if (response.statusCode == 200) {
      if (response.body.isEmpty) {
        throw Exception('Empty response from server');
      }
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return data;
    } else {
      final message =
          response.body.isNotEmpty ? response.body : 'No response body';
      throw Exception('Failed to login' +
          ' - Status code: ${response.statusCode}, Message: $message');
    }
  }
}
