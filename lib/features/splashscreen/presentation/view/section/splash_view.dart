import 'package:alquran_api/common/routes/routes_name.dart';
import 'package:alquran_api/features/dashboard/presentation/view/dashboard_page.dart';
import 'package:alquran_api/features/login/presentation/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constant/app_colors.dart';
import '../../../../../constant/app_text.dart';
import '../../../../../constant/url_asset.dart';
import '../../../../../widget/button/default_button_widget.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quran App',
                style: AppText.text24.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Learn Quran and \nRecite once everyday',
                style: AppText.text18.copyWith(
                  color: AppColors.greyDarkColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 49),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: MediaQuery.of(context).size.height * 1.5 / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.blueColor,
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    child: Opacity(
                      opacity: 0.5,
                      child: Image.asset(
                        UrlAsset.mosque,
                        width: 300,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -24,
                    child: DefaultButton(
                      title: 'Get Started',
                      onTap: () {
                        if (state is Authenticated) {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) {
                              return DashboardPage(
                                uid: state.uid,
                              );
                            },
                          ));
                        }
                        if (state is UnAuthenticated) {
                          Navigator.of(context)
                              .pushReplacementNamed(Routes.login);
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
