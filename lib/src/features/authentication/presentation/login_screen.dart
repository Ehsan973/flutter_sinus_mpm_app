import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/constants/constants.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sinus_mpm_application/src/features/authentication/widget/form_text_field.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  final Function(bool didLogin) onResult;

  const LoginScreen({super.key, required this.onResult});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

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
              FormTextField(
                text: 'نام کاربری',
                controller: _usernameTextEditingController,
              ),
              FormTextField(
                text: 'رمز عبور',
                controller: _passwordTextEditingController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const SignUpScreen(),
                      //   ),
                      // );
                      context.router.push(const SignUpRoute());
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
                  onPressed: () {
                    var username = _usernameTextEditingController.text;
                    var password = _passwordTextEditingController.text;
                  },
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
