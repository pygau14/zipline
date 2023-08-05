import 'package:courier_app/src/components/custom_sender.dart';
import 'package:courier_app/src/core/constants/dimensions.dart';
import 'package:courier_app/src/core/constants/palette.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_senderr.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/strings.dart';

class CompleteOrdersScreen extends StatelessWidget {
  const CompleteOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
          appBar: AppBar(),
          title: strItemDetail,
        containerColor: AppColors.orange,
        text: strComplete,
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
            height: height_55,
            isDivider: false,
          ),

        ],
      )),
    );
  }
}
