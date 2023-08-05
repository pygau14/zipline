import 'package:courier_app/src/features/auth/auth/auth.dart';
import 'package:courier_app/src/features/auth/new_password/new_password_controller.dart';
import 'package:courier_app/src/features/features/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';

class NewPasswordScreen extends GetView<AuthController> {
  const NewPasswordScreen({super.key});


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
                  text: strLetName,
                  color1: AppColors.black,
                  fontWeight: fontWeight700,
                  fontSize: font_20),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                  text: strInfoBelow,
                  color1: AppColors.greyColor,
                  fontWeight: fontWeight400,
                  fontSize: font_13),
            ),
            CustomDivider(
              height: height_30,
              isDivider: false,
            ),

            CustomTextField(
              labelText: strEnterPass,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.passIcon),
              ),
              obscure: false,
              height: height_15, textInputType: TextInputType.text,
            ), //email text-field

            CustomTextField(
              labelText: strConfirmPass,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.passIcon),
              ),
              suffixIcon: const Icon(
                Icons.remove_red_eye_outlined,
                color: AppColors.greyColor,
              ),
              obscure: true,
              height: 0, textInputType: TextInputType.text,
            ), // password text-field

            CustomDivider(
              height: height_40,
              isDivider: false,
            ),

            CustomButton(
              text: strSave,
              color: AppColors.white,
              fontWeight: fontWeight800,
              font: font_16,
              onPress: () {
                Get.to(HomeScreen());
              },
            ),

          ],
        ),
      ),
    );
  }
}
