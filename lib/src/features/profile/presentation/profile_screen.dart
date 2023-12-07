import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override 
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'Profile screen',
            style: TextStyle(color: Colors.red),
          )
        ]),
      ),
    );
  }
}
