import 'package:courier_app/src/components/custom_headcard.dart';
import 'package:courier_app/src/components/custom_items.dart';
import 'package:courier_app/src/components/custom_shipping_chip.dart';
import 'package:courier_app/src/components/custom_text_button.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/core/constants/custom_tiles.dart';
import 'package:courier_app/src/core/constants/dimensions.dart';
import 'package:courier_app/src/core/constants/palette.dart';
import 'package:courier_app/src/core/constants/strings.dart';
import 'package:courier_app/src/features/features/all_item/all_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/custom_navigation_bar.dart';
import '../../../components/custom_text.dart';
import '../../../components/custompaint.dart';
import '../../../core/constants/font_weight.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: margin_10),
            children: [
              CustomListTile(
                  colorBackCircle: AppColors.transparent,
                  border: AppColors.transparent,
                  icon: ImgAssets.transparent,
                  image: AssetImage(ImgAssets.forgotArt),
                  title: '${strHello} Mizan,',
                  subtitle: strWelcomeBack),
              CustomHeadcard(),

              CustomText(text: strService, color1: AppColors.black, fontWeight: fontWeight600, fontSize: font_19),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomItems(
                      image: AssetImage(ImgAssets.boxDrop),
                      text: strAddDrop,
                      onTap: (){},
                    ),
                    CustomItems(
                      image: AssetImage(ImgAssets.boxPick),
                      text: strAddPick,
                      onTap: (){},
                    ),
                    CustomItems(
                      image: AssetImage(ImgAssets.boxPending),
                      text: strDelPending,
                      onTap: (){},
                    ),
                    CustomItems(
                      image: AssetImage(ImgAssets.boxAllItem),
                      text: strAllItem,
                      onTap: (){
                        Get.to(AllItemScreen());
                      },
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      text: strRecentShip,
                      color1: AppColors.black,
                      fontWeight: fontWeight600,
                      fontSize: font_19),
                  CustomTextButton(
                      text: strViewAll,
                      color: AppColors.orange,
                      fontWeight: fontWeight600,
                      font: font_15, onPress: () {
                        Get.to(AllItemScreen());
                  },
                  ),

                ],
              ),

              for(int i=0; i<8; i++)
                ShippingChip(
                  orderUidNo: '#CG5462JI',
                  senderName: 'Mack Smith',
                  recieverName: 'Mizan Umair',
                  productName: 'Flower Vase',
                  time: 'Mar 16, 2023 / 05:47 PM',
                  buttonColor: AppColors.orange,
                  buttonName: strComplete,
                  bgColor: AppColors.lightOrg,
                ),

            ],
          )
      ),

    );
  }
}
