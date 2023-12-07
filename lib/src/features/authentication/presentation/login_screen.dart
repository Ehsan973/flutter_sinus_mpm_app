import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinus_mpm_application/src/app.dart';
import 'package:sinus_mpm_application/src/config/constants/constants.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/auth_md.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/bloc/bloc/auth_bloc.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/models/request_json_data_model.dart';
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
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Column(
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
                    if (state is AuthInitial) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: ElevatedButton(
                          onPressed: () {
                            var username = _usernameTextEditingController.text;
                            var password = _passwordTextEditingController.text;
                            var jsonDataModel =
                                RequestJsonDataModel(username, password);
                            context
                                .read<AuthBloc>()
                                .add(AuthLoginRequest(jsonDataModel));
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: CustomColors.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
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
                    if (state is AuthLoading) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: CustomColors.primaryColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                          child: const CircularProgressIndicator(),
                        ),
                      ),
                    ],
                    if (state is AuthResponse) ...[
                      state.responseEither.fold(
                        (errorMessage) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<AuthBloc>().add(AuthInitialize());
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              backgroundColor: CustomColors.primaryColor,
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                            ),
                            child: Wrap(
                              children: [
                                Text(
                                  errorMessage,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.restart_alt,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        (token) {
                          widget.onResult(true);
                          App.authProvider.loginUser(
                            AuthModel(token: token),
                          );
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 32),
                            child: ElevatedButton(
                              onPressed: () {
                                context.read<AuthBloc>().add(AuthInitialize());
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(double.infinity, 50),
                                backgroundColor: CustomColors.primaryColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    token,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    ]
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
