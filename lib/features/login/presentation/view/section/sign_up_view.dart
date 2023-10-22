import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/constant/url_asset.dart';
import 'package:alquran_api/features/dashboard/presentation/view/dashboard_page.dart';
import 'package:alquran_api/features/login/domain/entities/user_entity.dart';
import 'package:alquran_api/features/login/presentation/cubit/auth/auth_cubit.dart';
import 'package:alquran_api/features/login/presentation/cubit/user/user_cubit.dart';
import 'package:alquran_api/widget/button/default_button_widget.dart';
import 'package:alquran_api/widget/field/default_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  bool showPassword = true;

  @override
  void dispose() {
    super.dispose();
    nameC.clear();
    emailC.clear();
    passC.clear();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Column(
        children: [
          Text(
            'Quran App',
            style: AppText.text24.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Assalamualaikum',
            style: AppText.text16.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.greyDarkColor,
            ),
          ),
        ],
      );
    }

    Widget loginSection() {
      return Container(
        margin: const EdgeInsets.only(top: 36),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: AppText.text16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 22),
              DefaultTextField(
                controller: nameC,
                hintText: 'User Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 22),
              DefaultTextField(
                controller: emailC,
                hintText: 'email',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 31),
              DefaultTextField(
                controller: passC,
                hintText: 'password',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password wajib diisi';
                  }
                  return null;
                },
                isObscure: showPassword,
                suffixWidget: IconButton(
                  onPressed: () {
                    showPassword = !showPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    showPassword
                        ? Icons.remove_red_eye
                        : Icons.remove_red_eye_outlined,
                  ),
                ),
              ),
              const SizedBox(height: 44),
              DefaultButton(
                height: 40,
                title: 'Register',
                onTap: () {
                  if (!_formKey.currentState!.validate()) {
                    return;
                  }
                  submitSignUp();
                },
              ),
            ],
          ),
        ),
      );
    }

    Widget orRegisterSection() {
      return SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 33),
            Text(
              'Or',
              style: AppText.text14.copyWith(),
            ),
            const SizedBox(height: 26),
            InkWell(
              onTap: () {},
              child: Image.asset(UrlAsset.google, width: 24),
            ),
            const SizedBox(height: 31),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Have have an account ?  ',
                  style: AppText.text14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Login here',
                      overflow: TextOverflow.ellipsis,
                      style: AppText.text14.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.ayahLightColor,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: BlocConsumer<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return DashboardPage(uid: authState.uid);
                } else {
                  return _body(header, loginSection, orRegisterSection);
                }
              },
            );
          }

          return _body(header, loginSection, orRegisterSection);
        },
        listener: (context, state) {
          if (state is UserSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }
          if (state is UserFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Invalid Email'),
              ),
            );
          }
        },
      ),
    );
  }

  SafeArea _body(Widget Function() header, Widget Function() loginSection,
      Widget Function() orRegisterSection) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomCenter,
            opacity: 0.3,
            image: AssetImage(
              UrlAsset.mosque,
            ),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 73, horizontal: 30),
          children: [
            header(),
            loginSection(),
            orRegisterSection(),
          ],
        ),
      ),
    );
  }

  void submitSignUp() {
    if (nameC.text.isNotEmpty &&
        emailC.text.isNotEmpty &&
        passC.text.isNotEmpty) {
      BlocProvider.of<UserCubit>(context).submitSignUp(
        user: UserEntity(
          name: nameC.text,
          email: emailC.text,
          password: passC.text,
        ),
      );
    }
  }
}
