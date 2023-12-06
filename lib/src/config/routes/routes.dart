import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sinus_mpm_application/src/config/routes/controller/auth_guard.dart';
import 'package:sinus_mpm_application/src/features/authentication/presentation/login_screen.dart';
import 'package:sinus_mpm_application/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:sinus_mpm_application/src/features/create_pool/presentation/create_pool_screen.dart';
import 'package:sinus_mpm_application/src/features/join_pool/presentation/join_pool_screen.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/add_wallet_screen.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/profile_screen.dart';
import 'package:sinus_mpm_application/src/features/profile/presentation/transactions_list_screen.dart';
import 'package:sinus_mpm_application/src/features/root/presentation/root_screen.dart';

part 'routes.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// mainScreen
        AutoRoute(
          path: '/',
          guards: [AuthGuard()],
          initial: true,
          page: RootRoute.page,
          children: [
            AutoRoute(
              path: 'create_pool',
              page: CreatePoolRoute.page,
              initial: false,
            ),
            AutoRoute(
              path: 'join_pool',
              page: JoinPoolRoute.page,
            ),
            AutoRoute(
              initial: true,
              path: 'profile',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/login',
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/sign_up',
          page: SignUpRoute.page,
        ),
      ];
}
