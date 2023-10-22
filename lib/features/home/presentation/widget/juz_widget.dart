import 'package:flutter/material.dart';

import '../../../../constant/app_text.dart';
import '../../../../constant/url_asset.dart';
import '../../../../widget/misc/default_divider_widget.dart';

class JuzWidget extends StatelessWidget {
  const JuzWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
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
                child: Text(
                  'Juz 1',
                  style: AppText.text18.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const DefaultDividerWidget(),
        ],
      ),
    );
  }
}
