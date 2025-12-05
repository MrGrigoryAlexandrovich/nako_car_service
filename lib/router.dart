import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import "package:nako_car_service/screens/account.dart";
import "package:nako_car_service/screens/confirm_password_code.dart";
import "package:nako_car_service/screens/forgot_password.dart";
import "package:nako_car_service/screens/home.dart";
import "package:nako_car_service/screens/login.dart";
import "package:nako_car_service/screens/new_password.dart";
import "package:nako_car_service/screens/register.dart";
import "package:nako_car_service/screens/reservation.dart";
import "package:nako_car_service/screens/reservations.dart";

final GoRouter router = GoRouter(
  redirect: (context, state) {
    final user = FirebaseAuth.instance.currentUser;
    final loggingIn =
        state.uri.toString() == '/login' ||
        state.uri.toString() == '/register' ||
        state.uri.toString() == '/forgot' ||
        state.uri.toString() == '/confirm' ||
        state.uri.toString() == '/new';

    if (user == null && !loggingIn) {
      return '/login';
    }

    if (user != null &&
        (state.uri.toString() == '/login' ||
            state.uri.toString() == '/register')) {
      return '/';
    }

    return null;
  },
  routes: [
    GoRoute(
      path: '/confirm',
      builder: (context, state) => ConfirmPasswordCodeScreen(),
    ),
    GoRoute(
      path: '/forgot',
      builder: (context, state) => ForgotPasswordScreen(),
    ),
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    GoRoute(path: '/login', builder: (context, state) => LoginScreen()),
    GoRoute(path: '/new', builder: (context, state) => NewPasswordScreen()),
    GoRoute(path: '/register', builder: (context, state) => RegisterScreen()),
    GoRoute(
      path: '/reservation',
      builder: (context, state) => ReservationScreen(),
    ),
    GoRoute(
      path: '/reservations',
      builder: (context, state) => ReservationsScreen(),
    ),
    GoRoute(path: '/account', builder: (context, state) => AccountScreen()),
  ],
);
