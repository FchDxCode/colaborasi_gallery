
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginRepository {
  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('https://praktikum-cpanel-unbin.com/api_bumi_fachru_fahrizal_alif_fatir/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to login');
    }
  }
}
