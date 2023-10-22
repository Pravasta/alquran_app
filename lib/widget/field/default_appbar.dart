import 'package:flutter/material.dart';

import '../../constant/url_asset.dart';

AppBar defaultAppBar({
  required BuildContext context,
  required String title,
  bool needBack = true,
  void Function()? onPressedBack,
  List<Widget>? actions,
  bool needLeading = false,
}) {
  final title0 = Text(
    title,
  );

  return AppBar(
    title: title0,
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: true,
    actions: actions,
    leading: needBack
        ? IconButton(
            onPressed: onPressedBack ?? () => Navigator.of(context).pop(),
            icon: needLeading
                ? Image.asset(
                    UrlAsset.menu,
                    width: 24,
                  )
                : const Icon(
                    Icons.arrow_back_ios_new,
                    size: 16.0,
                  ),
          )
        : null,
  );
}
