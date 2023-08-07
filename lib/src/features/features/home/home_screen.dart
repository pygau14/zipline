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
import 'package:courier_app/src/features/features/all_item/all_orders_model.dart';
import 'package:courier_app/src/features/features/home/home_controller.dart';
import 'package:courier_app/src/features/features/item_details/complete_details.dart';
import 'package:courier_app/src/features/features/item_details/delivered%20_details.dart';
import 'package:courier_app/src/features/features/item_details/pending_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../components/custom_text.dart';
import '../../../core/constants/font_weight.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  HomeController homeController = Get.put(HomeController());

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
                  onTap: () {},
                ),
                CustomItems(
                  image: AssetImage(ImgAssets.boxPick),
                  text: strAddPick,
                  onTap: () {},
                ),
                CustomItems(
                  image: AssetImage(ImgAssets.boxPending),
                  text: strDelPending,
                  onTap: () {},
                ),
                CustomItems(
                  image: AssetImage(ImgAssets.boxAllItem),
                  text: strAllItem,
                  onTap: () {
                    Get.to(AllItemScreen());
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(text: strRecentShip, color1: AppColors.black, fontWeight: fontWeight600, fontSize: font_19),
              CustomTextButton(
                text: strViewAll,
                color: AppColors.orange,
                fontWeight: fontWeight600,
                font: font_15,
                onPress: () {
                  Get.to(const AllItemScreen());
                },
              ),
            ],
          ),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius_10)),
            child: Obx(() {
              final List<AllOrdersModel> orders = homeController.ordersList;
              return homeController.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: AppColors.orange,
                    ))
                  : ListView.builder(
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        AllOrdersModel order = orders[index];
                        String orderToken = order.orderToken.toString();
                        String senderName = order.senderName.toString();
                        String receiverName = order.receiverName.toString();
                        String productName = order.itemName.toString();
                        String dateAndTime = order.date.toString();
                        String status = order.status.toString();
                        Color buttonColor;
                        Color bgColor = AppColors.white;

                        if (status.toLowerCase() == 'pickup pending') {
                          buttonColor = AppColors.yellow;
                        } else if (status.toLowerCase() == 'completed') {
                          buttonColor = AppColors.orange;
                        } else {
                          buttonColor = AppColors.blue;
                        }

                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: InkWell(
                            onTap: () {
                              if (status.toLowerCase() == 'completed') {
                                Get.to(() => CompleteOrdersScreen(
                                      orderToken: orderToken,
                                    ));
                              } else if (status.toLowerCase() == 'delivered') {
                                Get.to(() => DeliveredOrdersScreen(
                                      orderToken: orderToken,
                                    ));
                              } else if (status.toLowerCase() == 'pickup pending') {
                                Get.to(() => PendingDetailsScreen(
                                      orderToken: orderToken,
                                    ));
                              } else if (status.toLowerCase() == 'delivery pending'){

                              }
                            },
                            child: ShippingChip(
                              orderUidNo: orderToken,
                              senderName: senderName,
                              recieverName: receiverName,
                              productName: productName,
                              time: dateAndTime,
                              buttonColor: buttonColor,
                              buttonName: status,
                              bgColor: bgColor,
                            ),
                          ),
                        );
                      },
                    );
            }),
          ),
        ],
      )),
    );
  }
}
