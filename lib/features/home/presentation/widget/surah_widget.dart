import 'package:alquran_api/widget/misc/default_divider_widget.dart';
import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../constant/url_asset.dart';

class SurahWidget extends StatelessWidget {
  const SurahWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        UrlAsset.number,
                      ),
                    ),
                  ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Al-Fatihah',
                        style: AppText.text18.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Meccan \u2022 7 Verses',
                        style: AppText.text14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.greyDarkColor,
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  'الفاتحة',
                  style: AppText.secondaryText18.copyWith(
                    fontSize: 20,
                    color: AppColors.ayahDarkColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const DefaultDividerWidget(),
        ],
      ),
    );
  }
}
