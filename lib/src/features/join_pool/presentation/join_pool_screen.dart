import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class JoinPoolScreen extends StatelessWidget {
  const JoinPoolScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          'Join pool screen',
          style: TextStyle(color: Colors.amber),
        )
      ]),
    );
  }
}
