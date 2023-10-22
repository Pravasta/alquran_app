import 'package:alquran_api/constant/app_text.dart';
import 'package:alquran_api/widget/field/default_appbar.dart';
import 'package:flutter/material.dart';

class PrivacyMenu extends StatelessWidget {
  const PrivacyMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Privacy & Policy',
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Center(
            child: Text(
              'Privacy Policy \n Last updated: January 11, 2022 \n This Privacy Policy describes Our policies and \n procedures on the collection, use and \n disclosure of Your information when You use \n the Service and tells You about Your privacy \n rights and how the law protects You. \n We use Your Personal data to provide and \n improve the Service. By using the Service, \n You agree to the collection and use of \n information in accordance with this Privacy \n Policy. This Privacy Policy has been created \n with the help of the Privacy Policy Template. \n Interpretation and Definitions \n Interpretation \n The words of which the initial letter is \n capitalized have meanings defined under \n the following conditions. The following \n definitions shall have the same meaning \n regardless of whether they appear in \n singular or in plural. \n Definitions \n For the purposes of this Privacy Policy: \n Account means a unique account created \n for You to access our Service or parts of our \n Service. \n Affiliate means an entity that controls, is \n controlled by or is under common control \n with a party, where "control" means \n ownership of 50% or more of the shares, \n equity interest or other securities entitled to \n vote for election of directors or other \n managing authority. \n Application means the software program \n provided by the Company downloaded by \n You on any electronic device, named Quran \n App \n\n\n Surakarta, Indonesia',
              style: AppText.text16.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
