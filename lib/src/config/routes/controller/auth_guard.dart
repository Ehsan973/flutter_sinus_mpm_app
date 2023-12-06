import 'package:auto_route/auto_route.dart';
import 'package:sinus_mpm_application/src/app.dart';
import 'package:sinus_mpm_application/src/config/routes/routes.dart';
import 'package:sinus_mpm_application/src/config/utils/logger.dart';

mixin AuthState {
  Future checkAuth(String path) async => await App.authProvider.checkAuth(path);
  bool get isLoggedIn => App.authProvider.isLoggedIn;
  bool isLoginRoute(NavigationResolver _) => _.route.name == LoginRoute.name;
  Future logOut()=> App.authProvider.logoutuUser() ;


}

class AuthGuard extends AutoRouteGuard with AuthState {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    await checkAuth(router.currentPath);
    logInfo('This route is :  ${router.currentPath}');
    if (isLoggedIn || isLoginRoute(resolver)) {
      logSuccess('isLoggedIn or LoginRoute ');
      resolver.next();
    } else {
      resolver.redirect(
        LoginRoute(onResult: (didLogin) {
          /// stop re-pushing any pending routes after current
          resolver.resolveNext(didLogin, reevaluateNext: false);
        }),
      );
    }
  }
}
