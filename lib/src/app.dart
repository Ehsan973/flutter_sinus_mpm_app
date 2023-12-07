import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sinus_mpm_application/src/config/constants/keys.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/config/routes/controller/auth_provider.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/config/utils/messages.dart';
import 'package:sinus_mpm_application/src/features/create_pool/cubit/create_pool_cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
  static AuthProvider authProvider = AuthProvider();
  static AppRouter appRouter = AppRouter();
}

class _AppState extends State<App> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    //

    return MultiBlocProvider(
      providers: [
        BlocProvider<CreatePoolCubit>(
          create: (context) => CreatePoolCubit(locator.get())
            ..stream.forEach((element) {
              if (element is CreatePoolInitial) {
                if (element.poolModel != null) {
                  logInfo('Pool is in intial state....');
                }
              }
            }),
        )
      ],
      child: MaterialApp.router(
        theme: ThemeData(
          buttonTheme: ButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          primaryColor: const Color(0xff1D43A6),
          colorScheme: const ColorScheme.light(
            primary: Color(0xff1D43A6),
          ),
          inputDecorationTheme: InputDecorationTheme(
              fillColor: const Color(0xffF6F6F6),
              enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffDBD4D4),
                  ),
                  borderRadius: BorderRadius.circular(2)),
              outlineBorder: const BorderSide(
                color: Color(0xffDBD4D4),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xffDBD4D4),
                  ),
                  borderRadius: BorderRadius.circular(2))),
          useMaterial3: true,
          fontFamily: ff,
        ),
        locale: const Locale('fa', 'IR'),
        debugShowCheckedModeBanner: false,
        routerDelegate: App.appRouter.delegate(
          reevaluateListenable: App.authProvider,
        ),
        routeInformationParser: App.appRouter.defaultRouteParser(),
      ),
    );
  }
}
