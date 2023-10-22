import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

class HelpAndSupportMenu extends StatelessWidget {
  const HelpAndSupportMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context: context, title: 'Help & Support'),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'For further information about this app',
              style: AppText.text18.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                text: '',
                children: [
                  TextSpan(
                    text: 'Contact : ',
                    style: AppText.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: 'fitrayanaf15@gmail.com',
                    style: AppText.text16.copyWith(
                      color: AppColors.blueColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
