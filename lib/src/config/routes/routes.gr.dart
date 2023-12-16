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
          isForJoin: args.isForJoin,
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
    bool isForJoin = false,
    List<PageRouteInfo>? children,
  }) : super(
          QRViewRoute.name,
          args: QRViewRouteArgs(
            key: key,
            afterCompleteScan: afterCompleteScan,
            isForJoin: isForJoin,
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
    this.isForJoin = false,
  });

  final Key? key;

  final dynamic Function(Barcode) afterCompleteScan;

  final bool isForJoin;

  @override
  String toString() {
    return 'QRViewRouteArgs{key: $key, afterCompleteScan: $afterCompleteScan, isForJoin: $isForJoin}';
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
