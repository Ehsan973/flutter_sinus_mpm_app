import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sinus_mpm_application/src/config/constants/keys.dart';
import 'package:sinus_mpm_application/src/config/get_it/get_it.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';
import 'package:sinus_mpm_application/src/features/authentication/data/auth_md.dart';

class AuthProvider extends ChangeNotifier {
  // Future<bool> get isLoggedIn async =>
  //     locator.get<SharedPreferences>().containsKey(accessTokenKey);
  bool _isLoggedIn = true;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }

  Future<void> loginUser(AuthModel authModel) async {
    final prefs = locator.get<SharedPreferences>();
    if (authModel.token != null) {
      prefs.setString(accessTokenKey, authModel.token!);

      login();
      notifyListeners();
    } else {
      //noting. we have not token and refresh token in AuthModel
    }
  }

  Future<void> logoutuUser() async {
    await locator.get<SharedPreferences>().clear();
    logout();
    notifyListeners();
  }

  Future checkAuth(String path) async {
    logSuccess('Checking Authentication state ....');

    final prefs = locator.get<SharedPreferences>();

    final AuthModel authModel = AuthModel(
      token: prefs.getString(accessTokenKey),
    );

    if (authModel.token != null) {
      logSuccess('Have permession using this route .... ($path) ');
      login();
      notifyListeners();
    } else {
      logoutuUser();
      notifyListeners();
    }
  }
}
