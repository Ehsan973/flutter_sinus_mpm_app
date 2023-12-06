import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/constants/constants.dart';
import 'package:sinus_mpm_application/src/features/authentication/presentation/login_screen.dart';
import 'package:sinus_mpm_application/src/features/authentication/widget/form_text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  'ثبت نام',
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ),
              const FormTextField(text: 'نام کاربری'),
              const FormTextField(text: 'رمز عبور'),
              const FormTextField(text: 'تکرار رمز عبور'),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'وارد شوید',
                        style: TextStyle(
                          color: CustomColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const Text('!حساب کاربری دارید'),
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
                    'ثبت نام',
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
