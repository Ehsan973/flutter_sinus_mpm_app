// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddWalletRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AddWalletScreen(),
      );
    },
    CreatePoolRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatePoolScreen(),
      );
    },
    JoinPoolRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const JoinPoolScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoginScreen(
          key: args.key,
          onResult: args.onResult,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfileScreen(),
      );
    },
    QRViewRoute.name: (routeData) {
      final args = routeData.argsAs<QRViewRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: QRViewScreen(
          key: args.key,
          afterCompleteScan: args.afterCompleteScan,
        ),
      );
    },
    RootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RootScreen(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpScreen(),
      );
    },
    TransactionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionsScreen(),
      );
    },
  };
}

/// generated route for
/// [AddWalletScreen]
class AddWalletRoute extends PageRouteInfo<void> {
  const AddWalletRoute({List<PageRouteInfo>? children})
      : super(
          AddWalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddWalletRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CreatePoolScreen]
class CreatePoolRoute extends PageRouteInfo<void> {
  const CreatePoolRoute({List<PageRouteInfo>? children})
      : super(
          CreatePoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePoolRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [JoinPoolScreen]
class JoinPoolRoute extends PageRouteInfo<void> {
  const JoinPoolRoute({List<PageRouteInfo>? children})
      : super(
          JoinPoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinPoolRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    Key? key,
    required dynamic Function(bool) onResult,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            key: key,
            onResult: onResult,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<LoginRouteArgs> page = PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({
    this.key,
    required this.onResult,
  });

  final Key? key;

  final dynamic Function(bool) onResult;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key, onResult: $onResult}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [QRViewScreen]
class QRViewRoute extends PageRouteInfo<QRViewRouteArgs> {
  QRViewRoute({
    Key? key,
    required dynamic Function(Barcode) afterCompleteScan,
    List<PageRouteInfo>? children,
  }) : super(
          QRViewRoute.name,
          args: QRViewRouteArgs(
            key: key,
            afterCompleteScan: afterCompleteScan,
          ),
          initialChildren: children,
        );

  static const String name = 'QRViewRoute';

  static const PageInfo<QRViewRouteArgs> page = PageInfo<QRViewRouteArgs>(name);
}

class QRViewRouteArgs {
  const QRViewRouteArgs({
    this.key,
    required this.afterCompleteScan,
  });

  final Key? key;

  final dynamic Function(Barcode) afterCompleteScan;

  @override
  String toString() {
    return 'QRViewRouteArgs{key: $key, afterCompleteScan: $afterCompleteScan}';
  }
}

/// generated route for
/// [RootScreen]
class RootRoute extends PageRouteInfo<void> {
  const RootRoute({List<PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpScreen]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TransactionsScreen]
class TransactionsRoute extends PageRouteInfo<void> {
  const TransactionsRoute({List<PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
