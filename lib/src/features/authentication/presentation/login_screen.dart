import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  final Function(bool didLogin) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Login Screen'),
      ]),
    );
  }
}
