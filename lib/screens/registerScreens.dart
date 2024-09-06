import 'package:flutter/material.dart';
import '../widgets/form_register.dart';
import '../widgets/logo.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Center(
        child: isSmallScreen
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  LogoWidget(),
                  RegisterFormWidget(),
                ],
              )
            : Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 800),
                child: Row(
                  children: const [
                    Expanded(child: LogoWidget()),
                    Expanded(
                      child: Center(child: RegisterFormWidget()),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}


