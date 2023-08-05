import 'package:courier_app/src/components/custom_list.dart';
import 'package:courier_app/src/components/custom_radio.dart';
import 'package:courier_app/src/features/features/add_order/add_order_controller.dart';
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
import 'add_order4_screen.dart';

class AddOrderThreeScreen extends StatefulWidget {
  const AddOrderThreeScreen({super.key});

  @override
  State<AddOrderThreeScreen> createState() => _AddOrderThreeScreenState();
}

class _AddOrderThreeScreenState extends State<AddOrderThreeScreen> {

  AddOrderController controller = Get.put(AddOrderController());

  int _currentStep = 0;

  bool isOpen = false;

  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  String? selectedValue=strSelectItemType;

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
      body: SafeArea(child: ListView(
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

          CustomTextField(
            labelText: strEnterItemName,
            prefixIcon: const Image(
              image: AssetImage(ImgAssets.boxItem),
            ),
            obscure: false,
            height: height_15, textInputType: TextInputType.text,
          ), //user text-field
          CustomTextField(
            labelText: strUploadItemImg,
            prefixIcon: const Image(
              image: AssetImage(ImgAssets.image),
            ),
            obscure: false,
            height: height_15, textInputType: TextInputType.text,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width_150,
                //height: height_80,
                child: CustomTextField(
                  labelText: strItemSize,
                  prefixIcon: const Image(
                    image: AssetImage(ImgAssets.itemSize),
                  ),
                  obscure: false,
                  height: height_15, textInputType: TextInputType.text,
                ),
              ),
              SizedBox(
                width: width_150,
                //height: height_80,
                child: CustomTextField(
                  labelText: strItemWeight,
                  prefixIcon: const Image(
                    image: AssetImage(ImgAssets.itemWeight),
                  ),
                  obscure: false,
                  height: height_15, textInputType: TextInputType.text,
                ),
              ),
            ],
          ),
          CustomDropdown(
            name: 'item type',
            labelText: strSelectItemType,
            labelColor: AppColors.greyColor,
            fontSize: font_12,
            fontWeight: fontWeight400,
            radius: radius_10,
            inputType: TextInputType.name,
            textColor: AppColors.orange,
            fillColor: AppColors.white,
            borderColor: AppColors.greyColor,
            suffixIcon: Image(image: AssetImage(ImgAssets.scroll), height: height_10,),
            prefixIcon: Image(image: AssetImage(ImgAssets.boxItem), height: height_10,),
            options: controller.dropdownItems,
            onChanged: (String value) {},
          ),

          CustomDivider(
            height: height_15,
            isDivider: false,
          ),

          CustomDropdown(
            name: 'item category',
            labelText: strSelectItemCateg,
            labelColor: AppColors.greyColor,
            fontSize: font_12,
            fontWeight: fontWeight400,
            radius: radius_10,
            inputType: TextInputType.name,
            textColor: AppColors.orange,
            fillColor: AppColors.white,
            borderColor: AppColors.greyColor,
            suffixIcon: Image(image: AssetImage(ImgAssets.scroll), height: height_10,),
            prefixIcon: Image(image: AssetImage(ImgAssets.itemCategory), height: height_10,),
            options: controller.dropdownCateg,
            onChanged: (String value) {},
          ),

          CustomDivider(
            height: height_15,
            isDivider: false,
          ),


          Align(
            alignment: Alignment.topLeft,
            child: CustomText(
                text: strDeliveryRequired,
                color1: AppColors.greyColor,
                fontWeight: fontWeight400,
                fontSize: font_13),
          ),
          CustomDivider(
            height: height_5,
            isDivider: false,
          ),

          CustomRadioButton(),

          CustomDivider(
            height: height_15,
            isDivider: false,
          ),
          CustomTextField(
            labelText: strCharges,
            prefixIcon: const Image(
              image: AssetImage(ImgAssets.charges),
            ),
            obscure: false,
            height: height_15, textInputType: TextInputType.text,
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
              Get.to(AddOrderFourScreen());
            },
          ),
          ]
      )),
    );
  }
}
