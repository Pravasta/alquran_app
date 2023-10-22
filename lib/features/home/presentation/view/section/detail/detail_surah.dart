import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/constant/url_asset.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:alquran_api/widget/misc/default_divider_widget.dart';
import 'package:flutter/material.dart';

import '../../../widget/detail_ayah_widget.dart';

class DetailSurah extends StatelessWidget {
  const DetailSurah({super.key});

  @override
  Widget build(BuildContext context) {
    headerSection() {
      return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xffDF98FA),
              Color(0xff9055FF),
            ],
          ),
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: Column(
                children: [
                  Text(
                    'Al-Fatihah',
                    style: AppText.text24.copyWith(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'The Opening',
                    style: AppText.text16.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const DefaultDividerWidget(
                    indent: 80,
                    thickness: 1,
                    endindent: 80,
                    color: AppColors.whiteColor,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Meccan \u2022 7 Verses',
                    style: AppText.text14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'الفاتحة',
                    style: AppText.secondaryText18.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -30,
              right: -70,
              child: Opacity(
                opacity: 0.08,
                child: Image.asset(
                  UrlAsset.quran,
                  width: 350,
                ),
              ),
            ),
          ],
        ),
      );
    }

    bodySection() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 7,
          itemBuilder: (context, index) {
            return const Column(
              children: [
                DetailAyahWidget(),
                SizedBox(height: 24),
              ],
            );
          },
        ),
      );
    }

    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Al-Fatihah',
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              UrlAsset.search,
              width: 20,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: ListView(
          children: [
            const SizedBox(height: 24),
            headerSection(),
            bodySection(),
          ],
        ),
      ),
    );
  }
}
