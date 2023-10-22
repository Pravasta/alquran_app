import 'package:alquran_api/constant/app_colors.dart';
import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/features/login/presentation/cubit/single_user/single_user_cubit.dart';
import 'package:alquran_api/features/settings/presentation/widget/button_menu_widget.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:alquran_api/widget/field/default_text_field.dart';
import 'package:alquran_api/widget/misc/default_circular_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountMenu extends StatefulWidget {
  const AccountMenu({super.key});

  @override
  State<AccountMenu> createState() => _AccountMenuState();
}

class _AccountMenuState extends State<AccountMenu> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  showNotifSuksesEdit() {
    final snakbar = SnackBar(
      content: Text(
        'Nama berhasil diganti',
        style: AppText.text16,
      ),
      backgroundColor: AppColors.bottomNavar,
      duration: const Duration(seconds: 1),
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
    );

    ScaffoldMessenger.of(context).showSnackBar(snakbar);
  }

  @override
  Widget build(BuildContext context) {
    Widget text(String title) {
      return Text(
        title,
        style: AppText.text16.copyWith(
          fontWeight: FontWeight.w500,
        ),
      );
    }

    return Scaffold(
        appBar: defaultAppBar(
          context: context,
          title: 'Account',
        ),
        body: BlocBuilder<SingleUserCubit, SingleUserState>(
          builder: (context, state) {
            if (state is SingleUserLoaded) {
              final currUser = state.userEntity;
              return Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text('Name'),
                      const SizedBox(height: 8),
                      DefaultTextField(
                        hintText: '',
                        initialText: '${currUser.name}',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama Wajib diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      text('Email'),
                      const SizedBox(height: 8),
                      DefaultTextField(
                        hintText: '',
                        initialText: '${currUser.email}',
                        readOnly: true,
                        isEnabled: false,
                      ),
                      const SizedBox(height: 30),
                      ButtonMenuWidget(
                        title: 'Save',
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          showNotifSuksesEdit();
                        },
                        backgroundColor: AppColors.amberColor,
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: DefaultCircularProgress(),
            );
          },
        ));
  }
}
