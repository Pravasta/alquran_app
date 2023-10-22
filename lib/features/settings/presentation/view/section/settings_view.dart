import 'package:alquran_api/common/routes/routes_name.dart';
import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/features/login/presentation/cubit/auth/auth_cubit.dart';
import 'package:alquran_api/features/settings/presentation/view/section/menu/about_menu.dart';
import 'package:alquran_api/features/settings/presentation/view/section/menu/account_menu.dart';
import 'package:alquran_api/features/settings/presentation/view/section/menu/help_support.dart';
import 'package:alquran_api/features/settings/presentation/view/section/menu/notifications_menu.dart';
import 'package:alquran_api/features/settings/presentation/view/section/menu/privacy_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widget/button_menu_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    routes(Widget route) {
      return Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => route,
      ));
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            ButtonMenuWidget(
              title: 'Account',
              onTap: () {
                routes(const AccountMenu());
              },
            ),
            const SizedBox(height: 20),
            ButtonMenuWidget(
              title: 'Notifications',
              onTap: () {
                routes(const NotificationMenu());
              },
            ),
            const SizedBox(height: 20),
            ButtonMenuWidget(
              title: 'Privacy & Policy',
              onTap: () {
                routes(const PrivacyMenu());
              },
            ),
            const SizedBox(height: 20),
            ButtonMenuWidget(
              title: 'Help & Support',
              onTap: () {
                routes(const HelpAndSupportMenu());
              },
            ),
            const SizedBox(height: 20),
            ButtonMenuWidget(
              title: 'About',
              onTap: () {
                routes(const AboutMenu());
              },
            ),
            const SizedBox(height: 20),
            ButtonMenuWidget(
              title: 'Log Out',
              onTap: () {
                BlocProvider.of<AuthCubit>(context).loggedOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.login, (route) => false);
              },
              backgroundColor: AppColors.amberColor,
            ),
          ],
        ),
      ),
    );
  }
}
