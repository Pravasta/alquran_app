import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/features/bookmark/presentation/view/bookmark_page.dart';
import 'package:alquran_api/features/dashboard/presentation/cubit/dashboard_cubit.dart';
import 'package:alquran_api/features/dashboard/presentation/widget/default_bottom_nabar.dart';
import 'package:alquran_api/features/home/presentation/view/home_page.dart';
import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:alquran_api/features/login/presentation/cubit/single_user/single_user_cubit.dart';
import 'package:alquran_api/features/prayer/presentation/view/prayer_page.dart';
import 'package:alquran_api/widget/misc/default_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/url_asset.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key, required this.uid});

  final String uid;

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  void initState() {
    BlocProvider.of<SingleUserCubit>(context).getSingleUser(uid: widget.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    buildContext(int index, UserEntity currUser) {
      switch (index) {
        case 1:
          return HomePage(userEntity: currUser);
        case 2:
          return const PrayerPage();
        case 3:
          return const BookmarkPage();
        default:
          return HomePage(userEntity: currUser);
      }
    }

    Widget customBottomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 27),
          color: AppColors.bottomNavar,
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DefaultBottomNavbar(
                index: 1,
                urlIcon: UrlAsset.quranicon,
              ),
              DefaultBottomNavbar(
                index: 2,
                urlIcon: UrlAsset.prayericon,
              ),
              DefaultBottomNavbar(
                index: 3,
                urlIcon: UrlAsset.bookmark,
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<SingleUserCubit, SingleUserState>(
      builder: (context, singleState) {
        if (singleState is SingleUserLoaded) {
          final currUser = singleState.userEntity;

          return Scaffold(
            body: BlocBuilder<DashboardCubit, int>(
              builder: (context, state) {
                return Stack(
                  children: [
                    buildContext(state, currUser),
                    customBottomNavigation(),
                  ],
                );
              },
            ),
          );
        }
        return const Center(child: DefaultCircularProgress());
      },
    );
  }
}
