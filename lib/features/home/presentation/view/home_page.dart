import 'package:alquran_api/common/routes/routes_name.dart';
import 'package:alquran_api/constant/url_asset.dart';
import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

import 'section/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Quran App',
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
      body: HomeView(userEntity: userEntity),
    );
  }
}
