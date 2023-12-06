import 'package:get_it/get_it.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/auth_datasource.dart';
import 'package:sinus_mpm_application/src/features/authentication/repository/auth_repository.dart';

final locator = GetIt.instance;

Future<void> configureDi() async {
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  locator.registerLazySingleton<PocketBase>(
      () => PocketBase('http://192.168.1.3:8090'));

  locator.registerLazySingleton<IAuthDatasource>(() => AuthRemoteDatasource());
  locator.registerLazySingleton<IAuthRepository>(() => AuthRepository());
}
