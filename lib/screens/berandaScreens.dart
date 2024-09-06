import 'package:flutter/material.dart';

class BerandaScreens extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Text('Selamat datang di aplikasi kami!'),
      ),
    );
  }
}