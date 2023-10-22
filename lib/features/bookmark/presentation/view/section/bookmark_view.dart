import 'package:alquran_api/constant/app_text.dart';
import 'package:flutter/material.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: Text(
          'Bookmark masih kosong',
          style: AppText.text18,
        ),
      ),
    );
  }
}
