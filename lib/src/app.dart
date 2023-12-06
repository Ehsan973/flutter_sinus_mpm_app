import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/config/routes/controller/auth_provider.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';

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

    return MaterialApp.router(
 theme: ThemeData.light(),

      debugShowCheckedModeBanner: false,

      routerDelegate: App.appRouter.delegate(
        // reevaluateListenable: App.authProvider,
      ),
      routeInformationParser: App.appRouter.defaultRouteParser(),
    );
  }
}
