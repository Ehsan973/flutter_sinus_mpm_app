import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
final locator = GetIt.instance;

Future<void> configureDi() async {
   locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
}