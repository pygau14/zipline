import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../components/custom_textfield.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';
import 'add_order3_screen.dart';

class AddOrderTwoScreen extends StatefulWidget {
  const AddOrderTwoScreen({super.key});

  @override
  State<AddOrderTwoScreen> createState() => _AddOrderTwoScreenState();
}

class _AddOrderTwoScreenState extends State<AddOrderTwoScreen> {
  int _currentStep = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appBar: AppBar(),
        title: strItemDetail,
        containerColor: AppColors.transparent,
        text: '',
        color: AppColors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: margin_15),
          children: [
            Container(
              width: double.infinity, //// Take full width of the screen
              height: height_60,
              decoration: BoxDecoration(
                color: AppColors.transparent,
              ),
              child: Stepper(
                currentStep: _currentStep,
                type: StepperType.horizontal,
                steps: [
                  Step(
                    title: Text(''),
                    content: Text(''),
                    isActive: _currentStep>=0,
                  ),
                  Step(
                    title: Text(''),
                    content: Text(''),
                    isActive: _currentStep>=1,
                  ),
                  Step(
                    title: Text(''),
                    content: Text(''),
                    isActive: _currentStep>=2,
                  ),
                  Step(
                    title: Text(''),
                    content: Text(''),
                    isActive: _currentStep>=3,
                  ),
                ],
                elevation: 0,
                onStepTapped: (index) {
                  setState(() {
                    _currentStep=index;
                  });
                },
              ),
            ),

            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                  text: strReceiverDetails,
                  color1: AppColors.black,
                  fontWeight: fontWeight700,
                  fontSize: font_20),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: CustomText(
                  text: strEnterDetBelow,
                  color1: AppColors.greyColor,
                  fontWeight: fontWeight400,
                  fontSize: font_13),
            ),

            CustomDivider(
              height: height_10,
              isDivider: false,
            ),
            CustomTextField(
              labelText: strEnterName,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.userIcon),
              ),
              obscure: false,
              height: height_15, textInputType: TextInputType.text,
            ), //user text-field

            CustomTextField(
              labelText: strMobNo,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.phoneIcon),
              ),
              obscure: false,
              height: 0, textInputType: TextInputType.number,
            ),

            CustomTextField(
              labelText: strEnterEmail,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.emailIcon),
              ),
              obscure: false,
              height: height_15, textInputType: TextInputType.text,
            ), //email text-field

            CustomText(
                text: strDeliveryAddress,
                color1: AppColors.greyColor,
                fontWeight: fontWeight400,
                fontSize: font_13),

            CustomDivider(
              height: height_10,
              isDivider: false,
            ),

            CustomTextField(
              labelText: strDoorFlat,
              prefixIcon: const Image(
                image: AssetImage(ImgAssets.locationIcon),
              ),
              obscure: false,
              height: height_15, textInputType: TextInputType.text,
            ),

            CustomTextField(
              labelText: strStreetArea,
              obscure: false,
              height: height_15,
              textInputType: TextInputType.text,
              prefixIcon: null,
            ),
            CustomTextField(
              labelText: strCityTown,
              obscure: false,
              height: height_15,
              textInputType: TextInputType.text,
              prefixIcon: null,
            ),
            CustomTextField(
              labelText: strPincode,
              obscure: false,
              height: height_15,
              textInputType: TextInputType.text,
              prefixIcon: null,
            ),
            CustomDivider(
              height: height_25,
              isDivider: false,
            ),
            CustomButton(
              text: strContinue,
              color: AppColors.white,
              fontWeight: fontWeight800,
              font: font_16,
              onPress: () {
                Get.to(AddOrderThreeScreen());
              },
            ),

          ],
        ),
      ),
    );

  }
}
