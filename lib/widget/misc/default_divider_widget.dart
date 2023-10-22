import 'package:flutter/material.dart';

import '../../constant/app_colors.dart';

class DefaultDividerWidget extends StatelessWidget {
  const DefaultDividerWidget({
    super.key,
    this.thickness = 0.3,
    this.indent,
    this.endindent,
    this.color = AppColors.greyDarkColor,
  });

  final double? thickness;
  final double? indent;
  final double? endindent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness,
      indent: indent,
      endIndent: endindent,
      color: color,
    );
  }
}
