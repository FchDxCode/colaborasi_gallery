import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterRepo {
  Future<void> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8000/api/register'), // Sesuaikan endpoint ke register
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
    
        'name': name,       // Tambahkan 'name' untuk registrasi
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Registration successful (status 201 indicates successful resource creation)
      return;
    } else {
      // If the server did not return a 201 Created response,
      // then throw an exception.
      throw Exception('Failed to register');
    }
  }
}
