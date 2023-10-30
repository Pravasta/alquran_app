import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/features/home/presentation/cubit/surah_cubit/surah_cubit.dart';
import 'package:alquran_api/features/home/presentation/widget/surah_widget.dart';
import 'package:alquran_api/widget/misc/default_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail/detail_surah.dart';

class SurahSection extends StatelessWidget {
  const SurahSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahLoading) {
          return const Center(
            child: DefaultCircularProgress(),
          );
        } else {
          if (state is SurahSucces) {
            return Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 24, bottom: 40),
              child: ListView.builder(
                itemCount: state.surah.length,
                itemBuilder: (context, index) {
                  final data = state.surah[index];

                  return SurahWidget(
                    data: data,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return DetailSurah(
                            data: data,
                          );
                        },
                      ));
                    },
                  );
                },
              ),
            );
          }
        }

        if (state is SurahFailed) {
          return Center(
            child: Text(
              state.error,
              style: AppText.text18,
            ),
          );
        }

        return Center(
          child: Text(
            'Tidak ada Data',
            style: AppText.text18,
          ),
        );
      },
    );
  }
}
