import 'package:alquran_api/features/settings/presentation/view/section/settings_view.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Settings',
      ),
      body: const SettingsView(),
    );
  }
}
