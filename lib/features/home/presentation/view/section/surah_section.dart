import 'package:alquran_api/features/home/presentation/widget/surah_widget.dart';
import 'package:flutter/material.dart';

import 'detail/detail_surah.dart';

class SurahSection extends StatelessWidget {
  const SurahSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 24, bottom: 40),
      child: ListView.builder(
        itemCount: 114,
        itemBuilder: (context, index) {
          return SurahWidget(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const DetailSurah();
                },
              ));
            },
          );
        },
      ),
    );
  }
}
