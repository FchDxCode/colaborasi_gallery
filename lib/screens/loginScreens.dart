import 'package:flutter/material.dart';
import '../widgets/form_login.dart';
import '../widgets/logo.dart';

class LoginScreens extends StatelessWidget {
  const LoginScreens({Key? key}) : super(key: key);

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
                      FormContentWidget()
                    ],
                  )
                : Container(
                    padding: const EdgeInsets.all(32.0),
                    constraints: const BoxConstraints(maxWidth: 800),
                    child: Row(
                      children: const [
                        Expanded(child: LogoWidget()),
                        Expanded(
                          child: Center(child: FormContentWidget()),
                        ),
                      ],
                    ),
                  )));
  }
}




