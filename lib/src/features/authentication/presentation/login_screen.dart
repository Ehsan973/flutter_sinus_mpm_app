import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/constants/constants.dart';
import 'package:sinus_mpm_application/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sinus_mpm_application/src/features/authentication/widget/form_text_field.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  final Function(bool didLogin) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  'ورود',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              const FormTextField(text: 'نام کاربری'),
              const FormTextField(text: 'رمز عبور'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'ثبت نام کنید',
                        style: TextStyle(
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const Text('!حساب کاربری ندارید'),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: CustomColors.primaryColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                  ),
                  child: const Text(
                    'ورود',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
