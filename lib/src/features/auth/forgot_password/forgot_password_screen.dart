import 'package:courier_app/src/core/constants/custom_tiles.dart';
import 'package:courier_app/src/features/auth/forgot_password/forgot_password_controller.dart';
import 'package:courier_app/src/features/auth/otp_mob/otp_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';
import '../auth/auth.dart';

class ForgotPasswordScreen extends GetView<AuthController> {
  const ForgotPasswordScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: margin_15),
          children: [

          CustomDivider(
            height: height_15,
            isDivider: false,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CustomText(
                text: strForget,
                color1: AppColors.black,
                fontWeight: fontWeight700,
                fontSize: font_20),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: CustomText(
                text: strForgotPass,
                color1: AppColors.greyColor,
                fontWeight: fontWeight400,
                fontSize: font_11),
          ),
          CustomDivider(
            height: height_30,
            isDivider: false,
          ),
          Image.asset(ImgAssets.forgotArt, height: height_250),
            CustomDivider(
              height: height_40,
              isDivider: false,
            ),
            const CustomListTile(
                colorBackCircle: AppColors.orange,
                border: AppColors.orange,
                icon: ImgAssets.msgIcon,
                title: strSendCodeSmS,
                subtitle: '(+91 0001 0001 0001)'),
            CustomDivider(
              height: height_16,
              isDivider: false,
            ),
            CustomListTile(
                colorBackCircle: AppColors.greyColor.withOpacity(.2),
                border: AppColors.greyColor,
                icon: ImgAssets.emailIcon,
                title: strSendCodeEmail,
                subtitle: 'ybl@mizan.com'),

            CustomDivider(
              height: height_60,
              isDivider: false,
            ),
            CustomButton(
              text: strGetOtp,
              color: AppColors.white,
              fontWeight: fontWeight800,
              font: font_16,
              onPress: () {
                Get.to(OTPMobScreen());

              },
            ),
          ],
        ),
      ),
    );
  }
}
