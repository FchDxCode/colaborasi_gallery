import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/register/regist_bloc.dart';
import '../bloc/register/register_state.dart';
import '../widgets/logo.dart';
import '../widgets/form_register.dart';
import 'tabScreens.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            // Navigate to TabScreens
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => TabScreen()),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: Center(
          child: isSmallScreen
              ? const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [LogoWidget(), RegisterFormWidget()],
                )
              : Container(
                  padding: const EdgeInsets.all(32.0),
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: const Row(
                    children: [
                      Expanded(child: LogoWidget()),
                      Expanded(
                        child: Center(child: RegisterFormWidget()),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
