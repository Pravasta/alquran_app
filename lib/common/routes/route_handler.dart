import 'package:alquran_api/common/routes/routes_name.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/features/login/presentation/view/login_page.dart';
import 'package:alquran_api/features/settings/presentation/view/settings_page.dart';
import 'package:alquran_api/features/splashscreen/presentation/view/splash_page.dart';
import 'package:flutter/material.dart';

class RouteHandler {
  static String initialRoutes = Routes.splash;
  static const initialNavbarVisibility = true;

  static Widget emptyPage() {
    return Scaffold(
        body: Center(child: Text('404 not Found', style: AppText.text18)));
  }

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
      case Routes.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => emptyPage(),
        );
    }
  }
}
