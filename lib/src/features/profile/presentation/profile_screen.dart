import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/app.dart';
import 'package:sinus_mpm_application/src/config/routes/controller/auth_guard.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget with AuthState {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile screen',
              style: TextStyle(color: Colors.red),
            ),
            ElevatedButton(
                onPressed: () {
                  logOut();
                },
                child: Text('Exit')),
          ],
        ),
      ),
    );
  }
}
