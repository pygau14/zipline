import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:courier_app/src/components/custom_headcard.dart';
import 'package:courier_app/src/components/custom_shipping_chip.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/core/constants/palette.dart';
import 'package:courier_app/src/core/constants/strings.dart';
import 'package:courier_app/src/features/features/all_item/all_item_controller.dart';
import 'package:courier_app/src/features/features/item_details/pending_details_screen.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_list.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../item_details/complete_details.dart';

class AllItemScreen extends GetView<AllItemController> {
   AllItemScreen({super.key});
  AllItemController controller = AllItemController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        appBar: AppBar(),
        title: strAllItem,
        containerColor: AppColors.transparent,
        text: '',
        color: AppColors.transparent,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: margin_10),
        children: [
        DefaultTabController(
        length: 5,
        child: Column(
          children: <Widget>[
            ButtonsTabBar(
              contentPadding: EdgeInsets.symmetric(horizontal: margin_10),
              backgroundColor: AppColors.orange,
              borderColor: AppColors.orange,
              borderWidth: 2,
              unselectedBackgroundColor: AppColors.white,
              unselectedBorderColor: AppColors.orange,
              unselectedLabelStyle: const TextStyle(color: AppColors.orange),
              labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              tabs: const [
                Tab(
                  text: strAll,
                ),
                Tab(
                  text: strComplete,
                ),
                Tab(
                  text: strDelivered,
                ),
                Tab(
                  text: strPickupPending,
                ),
                Tab(
                  text: strDelPending,
                ),
              ],
            ),
            
            
            Padding(
              padding: EdgeInsets.symmetric(vertical: height_10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 65,
                    width: width_200,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyColor.withOpacity(.5),),
                      borderRadius: BorderRadius.circular(radius_10)
                    ),
                    child: searchF(suffix: ImgAssets.searchIcon),
                  ),

                  Container(
                    height: 70,
                    width: width_130,
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.transparent,),
                        borderRadius: BorderRadius.circular(radius_10)
                    ),
                    child: CustomDropdown(
                      name: 'item type',
                      labelText: strSelectItemType,
                      labelColor: AppColors.greyColor,
                      fontSize: font_13,
                      fontWeight: fontWeight400,
                      radius: radius_10,
                      inputType: TextInputType.name,
                      textColor: AppColors.greyColor,
                      fillColor: AppColors.greyColor.withOpacity(.3),
                      borderColor: AppColors.transparent,
                      suffixIcon: Image(image: const AssetImage(ImgAssets.drop), height: height_10,),
                     // prefixIcon: Image(image: AssetImage(ImgAssets.transparent), height: height_10,),
                      options: controller.dropdownItems,
                      onChanged: (String value) {
                        if(controller.dropdownItems==controller.dropdownItems[2]){
                          showCustomDateRangePicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now().subtract(const Duration(days: 30)),
                            maximumDate: DateTime.now().add(const Duration(days: 30)),
                            endDate: DateTime(2025),
                            startDate: DateTime(2000),
                            backgroundColor: Colors.white,
                            primaryColor: Colors.green,
                            onApplyClick: (start, end) {
                            },
                            onCancelClick: () {
                            },
                          );
                        }
                        },
                    ),
                  )
                ],
              ),
            ),
            
            
            SizedBox(
              height: height_520,
             width: width_340,
              child: TabBarView(
                  children: <Widget>[
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius_10)
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding:  EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                               InkWell(
                                 onTap: (){
                                   Get.to(CompleteOrdersScreen());
                                 },
                                 child: ShippingChip(
                                  orderUidNo: '#CG5462JI',
                                  senderName: 'Mack Smith',
                                  recieverName: 'Mizan Umair',
                                  productName: 'Flower Vase',
                                  time: 'Mar 16, 2023 / 05:47 PM',
                                  buttonColor: AppColors.orange,
                                  buttonName: strComplete,
                                  bgColor: AppColors.white,
                              ),
                               ),
                              const ShippingChip(
                                orderUidNo: '#CG5462JI',
                                senderName: 'Mack Smith',
                                recieverName: 'Mizan Umair',
                                productName: 'Flower Vase',
                                time: 'Mar 16, 2023 / 05:47 PM',
                                buttonColor: AppColors.blue,
                                buttonName: strDelivered,
                                bgColor: AppColors.white,
                              ),
                               InkWell(
                                 onTap: (){
                                   Get.to(PendingDetailsScreen());
                                 },
                                 child: ShippingChip(
                                  orderUidNo: '#CG5462JI',
                                  senderName: 'Mack Smith',
                                  recieverName: 'Mizan Umair',
                                  productName: 'Flower Vase',
                                  time: 'Mar 16, 2023 / 05:47 PM',
                                  buttonColor: AppColors.yellow,
                                  buttonName: strPickupPending,
                                  bgColor: AppColors.white,
                              ),
                               ),
                              for(int i=0; i<10; i++)
                              ShippingChip(
                                orderUidNo: '#CG5462JI',
                                senderName: 'Mack Smith',
                                recieverName: 'Mizan Umair',
                                productName: 'Flower Vase',
                                time: 'Mar 16, 2023 / 05:47 PM',
                                buttonColor: AppColors.redColor,
                                buttonName: strDelPending,
                                bgColor: AppColors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius_10)
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for(int i=0; i<10; i++)
                              const ShippingChip(
                                orderUidNo: '#CG5462JI',
                                senderName: 'Mack Smith',
                                recieverName: 'Mizan Umair',
                                productName: 'Flower Vase',
                                time: 'Mar 16, 2023 / 05:47 PM',
                                buttonColor: AppColors.orange,
                                buttonName: strComplete,
                                bgColor: AppColors.white,
                              ),

                              ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius_10)
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for(int i=0; i<10; i++)
                                const ShippingChip(
                                  orderUidNo: '#CG5462JI',
                                  senderName: 'Mack Smith',
                                  recieverName: 'Mizan Umair',
                                  productName: 'Flower Vase',
                                  time: 'Mar 16, 2023 / 05:47 PM',
                                  buttonColor: AppColors.blue,
                                  buttonName: strDelivered,
                                  bgColor: AppColors.white,
                                ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius_10)
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for(int i=0; i<10; i++)
                                const ShippingChip(
                                  orderUidNo: '#CG5462JI',
                                  senderName: 'Mack Smith',
                                  recieverName: 'Mizan Umair',
                                  productName: 'Flower Vase',
                                  time: 'Mar 16, 2023 / 05:47 PM',
                                  buttonColor: AppColors.yellow,
                                  buttonName: strPickupPending,
                                  bgColor: AppColors.white,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius_10)
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              for(int i=0; i<10; i++)
                                ShippingChip(
                                  orderUidNo: '#CG5462JI',
                                  senderName: 'Mack Smith',
                                  recieverName: 'Mizan Umair',
                                  productName: 'Flower Vase',
                                  time: 'Mar 16, 2023 / 05:47 PM',
                                  buttonColor: AppColors.redColor,
                                  buttonName: strDelPending,
                                  bgColor: AppColors.white,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),

              ]),
            )
          ],
        ),)
        ],
      ),
    );
  }
}



