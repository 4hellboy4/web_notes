import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes_web/pages/auth_page/auth_page.dart';
import 'package:notes_web/pages/error_page/error_page.dart';
import 'package:notes_web/pages/guest_page/guest_page.dart';
import 'package:notes_web/pages/home_page/home_page.dart';
import 'package:notes_web/pages/login_page/login_page.dart';

class MyRouter {
  static const login = '/login';
  static const home = '/';
  static const auth = '/auth';
  static const error = '/error';
  static const guest = '/auth/guest';

  static Widget _homeBuilder(BuildContext context, GoRouterState steate) =>
      const HomePage();
  static Widget _loginBuilder(BuildContext context, GoRouterState state) =>
      const LoginPage();
  static Widget _authBuilder(BuildContext context, GoRouterState state) =>
      const AuthPage();
  static Widget _errorBuilder(BuildContext context, GoRouterState state) =>
      const ErrorPage();
  static Widget _guestBuilder(BuildContext context, GoRouterState state) =>
      const GuestPage();

  static final _router = GoRouter(
    initialLocation: home,
    routes: <GoRoute>[
      GoRoute(
        path: home,
        builder: _homeBuilder,
      ),
      GoRoute(
        path: login,
        builder: _loginBuilder,
      ),
      GoRoute(
        path: auth,
        builder: _authBuilder,
      ),
      GoRoute(
        path: guest,
        builder: _guestBuilder,
      ),
    ],
    errorBuilder: _errorBuilder,
  );

  static GoRouter get router => _router;
}
