import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class CreatePoolScreen extends StatelessWidget {
  const CreatePoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Create pool screen ')]),
      ),
    );
  }
}
