import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:flutter/material.dart';

class ButtonMenuWidget extends StatelessWidget {
  const ButtonMenuWidget({
    super.key,
    required this.title,
    this.onTap,
    this.backgroundColor = AppColors.bottomNavar,
  });

  final String title;
  final Function()? onTap;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15),
        backgroundColor: backgroundColor,
        foregroundColor: AppColors.blueColor,
      ),
      onPressed: onTap,
      child: Center(
        child: Text(
          title,
          style: AppText.text18.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
