import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DefaultBottomNavbar extends StatelessWidget {
  const DefaultBottomNavbar(
      {super.key, required this.urlIcon, required this.index});

  final String urlIcon;
  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<DashboardCubit>();

    return InkWell(
      onTap: () {
        controller.setPage(index);
      },
      child: Image.asset(
        urlIcon,
        width: 30,
        color: controller.state == index
            ? AppColors.blueColor
            : AppColors.greyDarkColor,
      ),
    );
  }
}
