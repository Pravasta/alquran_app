import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../constant/url_asset.dart';
import '../../../../widget/misc/default_divider_widget.dart';

class DetailAyahWidget extends StatelessWidget {
  const DetailAyahWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.bottomNavar,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13),
          width: double.infinity,
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.blueColor,
                child: Center(
                  child: Text(
                    '1',
                    style: AppText.text14.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Al-Fatihah',
                  style: AppText.text16.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Image.asset(UrlAsset.share, width: 24),
              const SizedBox(width: 16),
              Image.asset(UrlAsset.play, width: 24),
              const SizedBox(width: 16),
              Image.asset(
                UrlAsset.bookmark,
                width: 24,
                color: AppColors.ayahDarkColor,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'الْحَمْدُ لِلَّهِ رَبِّ الْعٰلَمِينَ',
            style: AppText.secondaryText18.copyWith(
              fontWeight: FontWeight.w700,
              height: 2.3,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '[All] praise is [due] to Allah, Lord of the worlds -',
          style: AppText.text18.copyWith(color: AppColors.greyDarkColor),
        ),
        const SizedBox(height: 16),
        const DefaultDividerWidget(),
      ],
    );
  }
}
