import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/constant/url_asset.dart';
import 'package:alquran_api/features/home/presentation/view/section/juz_section.dart';
import 'package:alquran_api/features/home/presentation/view/section/surah_section.dart';
import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    Widget headerSection() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamualaikum',
            style: AppText.text18.copyWith(
              color: AppColors.greyDarkColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${userEntity.name}',
            overflow: TextOverflow.ellipsis,
            style: AppText.text24.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    Widget bannerSection() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
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
              padding: const EdgeInsets.only(top: 19, left: 20, bottom: 19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        UrlAsset.last,
                        width: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Last Read',
                        style: AppText.text14.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Al-Fatihah',
                    style: AppText.text18.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Ayah no: 1',
                    style: AppText.text14,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -15,
              right: -30,
              child: Image.asset(
                UrlAsset.quran,
                width: 206,
              ),
            ),
          ],
        ),
      );
    }

    Widget tabbar() {
      Widget tabs(String title) {
        return Container(
          padding: const EdgeInsets.only(top: 12, bottom: 16),
          child: Text(
            title,
          ),
        );
      }

      return TabBar(
        indicatorColor: AppColors.ayahDarkColor,
        indicatorWeight: 3,
        labelColor: AppColors.whiteColor,
        unselectedLabelColor: AppColors.greyDarkColor,
        labelStyle: AppText.text16.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppText.text16.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.greyDarkColor,
        ),
        tabs: [
          tabs('Surah'),
          tabs('Juz'),
        ],
      );
    }

    Widget tabbarView() {
      return const TabBarView(
        children: [
          SurahSection(),
          JuzSection(),
        ],
      );
    }

    return DefaultTabController(
      length: 2,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24.0),
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  headerSection(),
                  bannerSection(),
                ],
              ),
            ),
            SliverAppBar(
              pinned: true,
              elevation: 0,
              backgroundColor: AppColors.primaryDarkColor,
              automaticallyImplyLeading: false,
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: tabbar(),
              ),
            ),
          ],
          body: tabbarView(),
        ),
      ),
    );
  }
}
