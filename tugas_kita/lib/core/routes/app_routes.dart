import 'package:flutter/material.dart';
import '../../features/onboarding/presentation/screens/splash_screen.dart';
import '../../features/onboarding/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/dashboard/presentation/screens/main_wrapper_screen.dart';
import '../../features/tasks/presentation/screens/add_task_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String register = '/register';
  static const String mainWrapper = '/main-wrapper';
  static const String addTask = '/add-task';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case mainWrapper:
        return MaterialPageRoute(builder: (_) => const MainWrapperScreen());
      case addTask:
        return MaterialPageRoute(builder: (_) => const AddTaskScreen());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
