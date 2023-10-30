import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:flutter/material.dart';

class DialogShowWidget {
  static Future<dynamic> dialogShowWidget({
    required BuildContext context,
    required String title,
    String content = '',
    Color backgroundColor = AppColors.whiteColor,
  }) {
    return showDialog(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 1 / 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: backgroundColor.withOpacity(0.8),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    title,
                    style: AppText.text18.copyWith(
                        color: AppColors.primaryDarkColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    content,
                    style: AppText.text16.copyWith(
                      color: AppColors.blueColor,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.copy_outlined,
                          color: AppColors.blueColor,
                        ),
                      ),
                      const SizedBox(width: 10),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: AppColors.blueColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
