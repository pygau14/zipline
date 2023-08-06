import 'package:courier_app/src/components/custom_about_package.dart';
import 'package:courier_app/src/components/custom_appbar.dart';
import 'package:courier_app/src/components/custom_container.dart';
import 'package:courier_app/src/components/custom_list.dart';
import 'package:courier_app/src/core/config/routes.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/features/features/add_order/add_order_controller.dart';
import 'package:courier_app/src/features/features/add_order/order_summary_model.dart';
import 'package:courier_app/src/features/features/signature_pad/signature_pad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final AddOrderController addOrderController = Get.put(AddOrderController());
  TextEditingController itemCategoryController = TextEditingController();

  int _currentStep = 0;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
  }

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
        child: FutureBuilder(
            future: addOrderController.getOrderSummary(addOrderController.orderId),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.orange,
                  ),
                );
              } else if (snapshot.hasData) {
                print('orderId 4 ${addOrderController.orderId}');
                OrderSummaryModel orderSummary = snapshot.data;

                String senderName = orderSummary.senderName.toString();
                String receiverName = orderSummary.receiverName.toString();
                String charges = orderSummary.charges.toString();
                String deliveryRequired = orderSummary.deliveryRequired.toString() == '1' ? 'Yes' : 'No';
                String itemType = orderSummary.type.toString();
                String itemCategory = orderSummary.category.toString();
                String weight = orderSummary.weight.toString();
                String size = orderSummary.size.toString();

                return ListView(
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
                            isActive: _currentStep >= 0,
                          ),
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 1,
                          ),
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 2,
                          ),
                          Step(
                            title: Text(''),
                            content: Text(''),
                            isActive: _currentStep >= 3,
                          ),
                        ],
                        elevation: 0,
                        onStepTapped: (index) {
                          setState(() {
                            _currentStep = index;
                            if (_currentStep >= 1) {
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
                          text: strAboutPack, color1: AppColors.black, fontWeight: fontWeight600, fontSize: font_18),
                    ),
                    CustomAboutPack(
                        senderName: senderName,
                        recieverName: receiverName,
                        charges: '\$ $charges',
                        deliveryRequires: deliveryRequired,
                        category: itemType,
                        weight: weight,
                        size: size),
                    CustomDivider(
                      height: height_15,
                      isDivider: false,
                    ),
                    Align(
                      heightFactor: 1.5,
                      alignment: Alignment.topLeft,
                      child: CustomText(
                          text: strItemCateg, color1: AppColors.black, fontWeight: fontWeight600, fontSize: font_18),
                    ),
                    const CustomContainer(
                      title: strPriority,
                      assetImage: AssetImage(ImgAssets.itemCategory),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.signature);
                      },
                      child: const CustomContainer(
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
                        Get.toNamed(AppRoutes.signature);
                      },
                    ),
                    CustomDivider(
                      height: height_55,
                      isDivider: false,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('An Error Occurred'),
                );
              }
            }),
      ),
    );
  }
}
