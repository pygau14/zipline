import 'package:courier_app/src/components/custom_about_package.dart';
import 'package:courier_app/src/components/custom_appbar.dart';
import 'package:courier_app/src/components/custom_container.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/features/features/signature_pad/signature_pad_screen.dart';
import 'package:courier_app/src/features/features/signature_pad/signature_reciever_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_text.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';
import 'add_order2_screen.dart';

class AddOrderFourScreen extends StatefulWidget {
  const AddOrderFourScreen({super.key});

  @override
  State<AddOrderFourScreen> createState() => _AddOrderFourScreenState();
}

class _AddOrderFourScreenState extends State<AddOrderFourScreen> {
  int _currentStep = 0;

  bool isOpen = false;


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
            padding: EdgeInsets.symmetric(horizontal: margin_10),
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
                      if(_currentStep>=1){
                        Get.to(AddOrderTwoScreen());
                      }
                    });
                  },
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: CustomText(
                    text: strPackageDetails,
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
                height: height_15,
                isDivider: false,
              ),
              Align(
                alignment: Alignment.topLeft,
                heightFactor: 1.5,
                child: CustomText(
                    text: strAboutPack,
                    color1: AppColors.black,
                    fontWeight: fontWeight600,
                    fontSize: font_18),
              ),
              CustomAboutPack(
                  senderName: 'Mizan Umair',
                  recieverName: 'Mo. Rehan Shareef',
                  charges: '\$ 50',
                  deliveryRequires: 'Yes',
                  category: 'Electronics',
                  weight: '5.5 Kg',
                  size: 'Lxwxh'),
              CustomDivider(
                height: height_15,
                isDivider: false,
              ),
              Align(
                heightFactor: 1.5,
                alignment: Alignment.topLeft,
                child: CustomText(
                    text: strItemCateg,
                    color1: AppColors.black,
                    fontWeight: fontWeight600,
                    fontSize: font_18),
              ),
              CustomContainer(
                title: strPriority,
                assetImage: AssetImage(ImgAssets.itemCategory),
              ),
              InkWell(
                onTap: (){
                  Get.to(SignaturePadScreen());
                },
                child: CustomContainer(
                  title: strAddSign,
                  assetImage: AssetImage(ImgAssets.plus),
                ),
              ),
              CustomDivider(
                height: height_35,
                isDivider: false,
              ),
              CustomButton(
                text: strAddItem,
                color: AppColors.white,
                fontWeight: fontWeight800,
                font: font_16,
                onPress: () {
                  print('object');
                },
              ),
              CustomDivider(
                height: height_55,
                isDivider: false,
              ),
            ],
          ),
      ),
    );
  }
}
