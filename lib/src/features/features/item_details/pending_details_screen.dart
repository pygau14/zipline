import 'package:courier_app/src/features/features/signature_pad/signature_reciever_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_container.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_sender.dart';
import '../../../components/custom_senderr.dart';
import '../../../components/custom_text.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../../../core/constants/palette.dart';
import '../../../core/constants/strings.dart';
import 'complete_details.dart';

class PendingDetailsScreen extends StatelessWidget {
  const PendingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appBar: AppBar(),
        title: strItemDetail,
        containerColor: AppColors.yellow,
        text: strPickupPending,
        color: AppColors.white,
        onPress: (){},
      ),
      body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: margin_15),
            children: [

              CustomDivider(
                height: height_25,
                isDivider: false,
              ),

              CustomSenderDetails(
                name: 'Mizan',
                contact: '7890008944565',
                email: 'yy@gmail.com',
                address: 'Lucknow',
                heading: strAboutPack,
              ),

              CustomDivider(
                height: height_25,
                isDivider: false,
              ),


              CustomSenderDetails(
                name: 'Rehan',
                contact: '9795887789641',
                email: 'oo@gmail.com',
                address: 'Knp',
                heading: strRecieverInfo,
              ),

              CustomDivider(
                height: height_25,
                isDivider: false,
              ),


              CustomSender(
                  name: 'name',
                  size: 'size',
                  imgText: ImgAssets.forgotArt,
                  weight: 'weight',
                  types: 'types',
                  category: 'category',
                  delivery: 'delivery',
                  charges: 'charges',
                  heading: strPackageDetails),

              CustomDivider(
                height: height_15,
                isDivider: false,
              ),
              Align(
                heightFactor: 1.5,
                alignment: Alignment.topLeft,
                child: CustomText(
                    text: strTakeRecSign,
                    color1: AppColors.black,
                    fontWeight: fontWeight600,
                    fontSize: font_15),
              ),
              InkWell(
                onTap: (){
                  Get.to(SignatureRecieverScreen());
                },
                child: CustomContainer(
                  title: strAddSign,
                  assetImage: AssetImage(ImgAssets.plus),
                ),
              ),
              CustomDivider(
                height: height_25,
                isDivider: false,
              ),
              CustomButton(
                text: strMarkAsComp,
                color: AppColors.white,
                fontWeight: fontWeight800,
                font: font_16,
                onPress: () {
                  print('object');
                },
              ),
              CustomDivider(
                height: height_65,
                isDivider: false,
              ),
            ],
          )),
    );
  }
}
