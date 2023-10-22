import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.width = 60,
      this.height = 60});

  final String title;
  final VoidCallback onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.amberColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: Size(width!, height!)),
      onPressed: onTap,
      child: Text(
        title,
        style: AppText.text18.copyWith(
          color: AppColors.primaryDarkColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
