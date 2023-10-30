import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:flutter/material.dart';

import '../../../../constant/app_colors.dart';
import '../../../../constant/app_text.dart';
import '../../../../constant/url_asset.dart';
import '../../../../widget/misc/default_divider_widget.dart';

class DetailAyahWidget extends StatelessWidget {
  const DetailAyahWidget({super.key, required this.data});

  final AyatEntity data;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.blueColor,
                child: Center(
                  child: Text(
                    '${data.nomorAyat}',
                    style: AppText.text14.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
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
              )
            ],
          ),
        ),
        const SizedBox(height: 24),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            data.teksArab,
            style: AppText.secondaryText18.copyWith(
              fontWeight: FontWeight.w700,
              height: 2.3,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            data.teksLatin,
            style: AppText.secondaryText18.copyWith(
              fontWeight: FontWeight.w700,
              height: 2.3,
              color: AppColors.greyDarkColor,
            ),
            textAlign: TextAlign.right,
          ),
        ),
        const SizedBox(height: 16),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            data.teksIndonesia,
            style: AppText.text18.copyWith(color: AppColors.greyDarkColor),
          ),
        ),
        const SizedBox(height: 16),
        const DefaultDividerWidget(),
      ],
    );
  }
}
