import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/constant/url_asset.dart';
import 'package:alquran_api/features/home/domain/entities/detail_surah_entity.dart';
import 'package:alquran_api/features/home/domain/entities/surah_entity.dart';
import 'package:alquran_api/features/home/presentation/cubit/detail_surah_cubit/detail_surah_cubit.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:alquran_api/widget/misc/alert_dialog.dart';
import 'package:alquran_api/widget/misc/default_circular_progress_widget.dart';
import 'package:alquran_api/widget/misc/default_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widget/detail_ayah_widget.dart';

class DetailSurah extends StatefulWidget {
  const DetailSurah({super.key, required this.data});

  final SurahEntity data;

  @override
  State<DetailSurah> createState() => _DetailSurahState();
}

class _DetailSurahState extends State<DetailSurah> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DetailSurahCubit>(context)
        .getDetailSurah(widget.data.nomor);
  }

  @override
  Widget build(BuildContext context) {
    headerSection(DetailSurahEntity data) {
      return InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          DialogShowWidget.dialogShowWidget(
            context: context,
            title: data.namaLatin,
            content: data.deskripsi,
          );
        },
        child: Container(
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
                      widget.data.namaLatin,
                      style: AppText.text24.copyWith(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.data.arti,
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
                      '${widget.data.tempatTurun} \u2022 ${widget.data.jumlahAyat} Verses',
                      style: AppText.text14.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      data.ayat[0].teksArab,
                      style: AppText.secondaryText18.copyWith(
                        fontSize: 32,
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
        ),
      );
    }

    bodySection() {
      return BlocBuilder<DetailSurahCubit, DetailSurahState>(
        builder: (context, state) {
          if (state is DetailSurahLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const DefaultCircularProgress(),
                  const SizedBox(height: 10),
                  Text(
                    'Loading..',
                    style: AppText.text16.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is DetailSurahFailed) {
            return Center(
              child: Text(
                state.error,
                style: AppText.text16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            );
          }

          if (state is DetailSurahSucces) {
            final data = state.detailSurah;

            return Column(
              children: [
                headerSection(data),
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.ayat.length - 1,
                    itemBuilder: (context, index) {
                      final ayah = data.ayat.sublist(1)[index];

                      return Column(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onLongPress: () {
                              //  Fitur Copy
                            },
                            child: DetailAyahWidget(
                              data: ayah,
                            ),
                          ),
                          const SizedBox(height: 24),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return Center(
            child: Text(
              'Tidak ada data',
              style: AppText.text16.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          );
        },
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
            bodySection(),
          ],
        ),
      ),
    );
  }
}
