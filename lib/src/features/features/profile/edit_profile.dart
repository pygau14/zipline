import 'dart:io';

import 'package:courier_app/src/components/custom_navigation_bar.dart';
import 'package:courier_app/src/components/custom_prof_container.dart';
import 'package:courier_app/src/components/custom_radio.dart';
import 'package:courier_app/src/components/custompaint.dart';
import 'package:courier_app/src/features/features/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../components/custom_text_button.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';

class EditProfileScreen extends GetView<ProfileController> {
   EditProfileScreen({super.key});
  ProfileController controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appBar: AppBar(),
        title: strEditProfile,
        containerColor: AppColors.transparent,
        text: '',
        color: AppColors.transparent,
      ),
      body: SafeArea(
        child:ListView(
          padding: EdgeInsets.symmetric(horizontal: margin_15),
          children: [
            Obx(()  {
              return Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      controller.getImage();
                      print('object');
                    },
                    child: CircleAvatar(
                      backgroundImage: controller.imagePath.isNotEmpty? FileImage(File(controller.imagePath.toString())):null,
                      radius: radius_40,
                      child: Align(
                          alignment: Alignment.bottomRight,
                          child: Image(image: AssetImage(ImgAssets.camera), height: height_22)),
                    ),
                  ),

                ],
              );
            }),
            CustomDivider(
              height: height_15,
              isDivider: false,
            ),

            CustomProfContainer(
              assetName: ImgAssets.userIcon,
              text: 'Mizan Umair',
            ),
            CustomProfContainer(
              assetName: ImgAssets.emailIcon,
              text: 'm.a@gmail.com',
            ),
            CustomProfContainer(
              assetName: ImgAssets.phoneIcon,
              text: '+32752542',
            ),
            CustomTextField(
              labelText: strEnterCompany,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.companyIcon),
              ),
              obscure: false,
              height: height_15, textInputType: TextInputType.text,
            ),
            CustomTextField(
              labelText: 'Lucknow, Uttar Pradesh',
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.locationIcon),
              ),
              obscure: false,
              height: height_15, textInputType: TextInputType.text,
            ),
            CustomRadioButton(),
            CustomDivider(
              height: height_15,
              isDivider: false,
            ),
            CustomProfContainer(
              assetName: ImgAssets.uploadIcon,
              text: 'Gov. ID Proof',
            ),

            CustomDivider(
              height: height_15,
              isDivider: false,
            ),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: margin_120),
              child: CustomButton(
                text: strSave,
                color: AppColors.white,
                fontWeight: fontWeight600,
                font: font_15,
                onPress: () {},
              ),
            ),


            CustomDivider(
              height: height_55,
              isDivider: false,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    );
  }
}
