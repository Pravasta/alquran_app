import 'package:alquran_api/features/bookmark/presentation/view/section/bookmark_view.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

import '../../../../common/routes/routes_name.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Bookmarks',
        needLeading: true,
        onPressedBack: () {
          Navigator.of(context).pushNamed(Routes.settings);
        },
      ),
      body: const BookmarkView(),
    );
  }
}
