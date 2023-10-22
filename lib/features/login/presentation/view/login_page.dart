import 'package:alquran_api/features/login/presentation/view/section/login_view.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginView(),
    );
  }
}
