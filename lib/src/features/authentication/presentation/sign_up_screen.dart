import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/constants/constants.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/models/request_json_data_model.dart';
import 'package:sinus_mpm_application/src/features/authentication/presentation/login_screen.dart';
import 'package:sinus_mpm_application/src/features/authentication/widget/form_text_field.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _usernameTextEditingController =
      TextEditingController();

  final TextEditingController _passwordTextEditingController =
      TextEditingController();

  final TextEditingController _passwordConfirmTextEditingController =
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
                'ثبت نام',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            FormTextField(
                text: 'نام کاربری', controller: _usernameTextEditingController),
            FormTextField(
                text: 'رمز عبور', controller: _passwordTextEditingController),
            FormTextField(
                text: 'تکرار رمز عبور',
                controller: _passwordConfirmTextEditingController),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => LoginScreen(onResult: (_) async {
                    //       return;
                    //     }),
                    //   ),
                    // );
                    context.router.push(LoginRoute(onResult: (_) async {
                      return;
                    }));
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
                onPressed: () {
                  var username = _usernameTextEditingController.text;
                  var password = _passwordTextEditingController.text;
                  var passwordConfirm =
                      _passwordConfirmTextEditingController.text;
                  var jsonModel =
                      RequestJsonDataModel(username, password, passwordConfirm);
                },
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
    ));
  }
}
