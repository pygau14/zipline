import 'package:courier_app/src/components/custom_divider.dart';
import 'package:courier_app/src/components/custom_text.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/core/constants/dimensions.dart';
import 'package:courier_app/src/core/constants/font_weight.dart';
import 'package:courier_app/src/core/constants/strings.dart';
import 'package:flutter/material.dart';

import '../core/constants/palette.dart';

class CustomHeadcard extends StatelessWidget {
  const CustomHeadcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height_140,
      width: width_240,
      decoration: BoxDecoration(color: AppColors.lightOrange, borderRadius: BorderRadius.circular(radius_15)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: margin_15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomText(text: strTrackPack, color1: AppColors.black, fontWeight: fontWeight600, fontSize: font_19),
                Image(image: AssetImage(ImgAssets.boxTrack))
              ],
            ),
            CustomText(text: strTrackId, color1: AppColors.greyColor, fontWeight: fontWeight500, fontSize: font_12),
            CustomDivider(
              height: height_10,
              isDivider: false,
            ),
            searchF(suffix: ImgAssets.searchIcon)
          ],
        ),
      ),
    );
  }
}

Widget searchF(
    {required String suffix, TextEditingController? controller, Function()? onTap, Function(String)? onChanged}) {
  return TextFormField(
    onChanged: onChanged,
    style: const TextStyle(color: AppColors.orange),
    decoration: InputDecoration(
      labelText: strShippingUID,
      labelStyle: TextStyle(fontSize: font_12),
      fillColor: AppColors.white,
      suffixIcon: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(right: margin_12, top: margin_4, bottom: margin_4),
          child: Image(image: AssetImage(suffix), width: width_10),
        ),
      ),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_8), borderSide: BorderSide(color: AppColors.transparent)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius_8), borderSide: BorderSide(color: AppColors.transparent)),
    ),
    controller: controller,
  );
}
