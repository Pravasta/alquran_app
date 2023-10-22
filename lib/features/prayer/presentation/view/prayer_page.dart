import 'package:alquran_api/constant/url_asset.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../common/routes/routes_name.dart';

class PrayerPage extends StatelessWidget {
  const PrayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Prayer',
        needLeading: true,
        onPressedBack: () {
          Navigator.of(context).pushNamed(Routes.settings);
        },
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              UrlAsset.search,
              width: 24,
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text('PrayerPage'),
      ),
    );
  }
}
