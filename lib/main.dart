import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/app.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (kIsWeb) {
  //   usePathUrlStrategy();
  // }
  await configureDi();
  // await initMapSettings();
  
  runApp(const App());
}
 
