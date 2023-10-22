import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

class NotificationMenu extends StatefulWidget {
  const NotificationMenu({super.key});

  @override
  State<NotificationMenu> createState() => _NotificationMenuState();
}

class _NotificationMenuState extends State<NotificationMenu> {
  bool _isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Notification'),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Reminders',
                    style: AppText.text16,
                  ),
                ),
                Switch.adaptive(
                  activeColor: AppColors.ayahDarkColor,
                  value: _isSwitch,
                  onChanged: (value) {
                    _isSwitch = value;
                    setState(() {});
                  },
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Recommendations',
                    style: AppText.text16,
                  ),
                ),
                Switch.adaptive(
                  activeColor: AppColors.ayahDarkColor,
                  value: _isSwitch,
                  onChanged: (value) {
                    _isSwitch = value;
                    setState(() {});
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
