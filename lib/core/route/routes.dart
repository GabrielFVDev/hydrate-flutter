import 'package:go_router/go_router.dart';
import 'package:hydrate/features/screens/splash_screen.dart';
import 'package:hydrate/features/screens/water_intake_screen.dart';
import 'package:hydrate/features/screens/welcome_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/water-intake',
      builder: (context, state) => const WaterIntakeScreen(),
    ),
  ],
);
