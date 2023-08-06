import 'package:courier_app/src/components/custom_text_button.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/core/constants/dimensions.dart';
import 'package:courier_app/src/features/features/profile/edit_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appBar: AppBar(),
        title: strProfile,
        containerColor: AppColors.transparent,
        text: '',
        color: AppColors.transparent,
      ),
      body: SafeArea(
        child:ListView(
          padding: EdgeInsets.symmetric(horizontal: margin_15),
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: radius_40,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Image(image: AssetImage(ImgAssets.badge), height: height_20)),
                ),

              ],
            ),
            Align(
              alignment: Alignment.center,
             // heightFactor: 1.5,
              child: CustomText(
                  text: 'Mizan Umair',
                  color1: AppColors.black,
                  fontWeight: fontWeight700,
                  fontSize: font_20),
            ),
            Align(
              alignment: Alignment.center,
              //heightFactor: .1,
              child: CustomText(
                  text: 'email@gmail.com',
                  color1: AppColors.greyColor,
                  fontWeight: fontWeight400,
                  fontSize: font_13),
            ),
            CustomDivider(
              height: height_25,
              isDivider: false,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width_100),
              child: CustomButton(
                text: strEditProfile,
                color: AppColors.white,
                fontWeight: fontWeight800,
                font: font_16,
                onPress: () {
                  Get.to(EditProfileScreen());
                },
              ),
            ),
            CustomDivider(
              height: height_25,
              isDivider: false,
            ),
            Divider(
              color: AppColors.greyColor.withOpacity(.2),
              thickness: 1,
              height: height_10,
              indent: 20,
              endIndent: 20,
            ),
            CustomDivider(
              height: height_20,
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              children: [
                Image(image: AssetImage(ImgAssets.logOut), width: width_30,),

                CustomTextButton(
                    text: strLogout,
                    color: AppColors.orange,
                    fontWeight: fontWeight700,
                    font: font_16,
                    onPress: (){})
              ],
            )
          ],
        ),
      ),
    );
  }
}
