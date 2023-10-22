import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

class AboutMenu extends StatelessWidget {
  const AboutMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'About',
      ),
      body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Welcome to Quran App, your number one source for all good things. We\'re dedicated to providing you the best of agirah, with a focus on agirah. \n\nWe\'re working to turn our mission towards agirah. We hope you get the good information as much as we gather offering them to you. \n\n\nRegards, \n\nPravasta Rama F',
                style: AppText.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'Quran App \nv 1.0',
                style: AppText.text18.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          )),
    );
  }
}
