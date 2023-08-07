import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:courier_app/src/components/custom_headcard.dart';
import 'package:courier_app/src/components/custom_shipping_chip.dart';
import 'package:courier_app/src/core/constants/assets.dart';
import 'package:courier_app/src/core/constants/palette.dart';
import 'package:courier_app/src/core/constants/strings.dart';
import 'package:courier_app/src/features/features/all_item/all_item_controller.dart';
import 'package:courier_app/src/features/features/all_item/all_orders_model.dart';
import 'package:courier_app/src/features/features/item_details/delivered%20_details.dart';
import 'package:courier_app/src/features/features/item_details/pending_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../components/custom_appbar.dart';
import '../../../components/custom_list.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/font_weight.dart';
import '../item_details/complete_details.dart';

class AllItemScreen extends StatefulWidget {
  final String selectedStatus;

  const AllItemScreen({Key? key, this.selectedStatus = 'All'}) : super(key: key);

  @override
  State<AllItemScreen> createState() => _AllItemScreenState();
}

class _AllItemScreenState extends State<AllItemScreen> {
  AllItemController allItemsController = Get.put(AllItemController());
  TextEditingController searchController = TextEditingController();



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
            length: 4,
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
                  labelStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  onTap: (index) {
                    allItemsController.searchQuery.value = '';
                    searchController.clear();
                    // Fetch orders based on the selected tab
                    allItemsController.selectedStatus = allItemsController.statuses[index];
                    if (allItemsController.selectedStatus == 'All' && allItemsController.selectedDate.isEmpty) {
                      allItemsController.fetchAllOrders();
                    } else if (allItemsController.selectedStatus == 'All' &&
                        allItemsController.selectedDate.isNotEmpty) {
                      allItemsController.fetchOrdersByDate(allItemsController.selectedDate);
                    } else if (allItemsController.selectedStatus != 'All' &&
                        allItemsController.selectedDate.isNotEmpty) {
                      allItemsController.fetchOrdersByStatusAndDate(
                          allItemsController.selectedStatus, allItemsController.selectedDate);
                    } else {
                      allItemsController.fetchOrdersByStatus(allItemsController.selectedStatus);
                    }
                  },
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
                            border: Border.all(
                              color: AppColors.greyColor.withOpacity(.5),
                            ),
                            borderRadius: BorderRadius.circular(radius_10)),
                        child: searchF(
                            suffix: ImgAssets.searchIcon,
                            controller: searchController,
                            onChanged: (value) {
                              allItemsController.searchQuery.value = value;
                              allItemsController.filterOrdersBySearchQuery();
                            }),
                      ),
                      Container(
                          height: 70,
                          width: width_130,
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(radius_10)),
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
                            suffixIcon: Image(
                              image: const AssetImage(ImgAssets.drop),
                              height: height_10,
                            ),
                            // prefixIcon: Image(image: AssetImage(ImgAssets.transparent), height: height_10,),
                            options: allItemsController.dropdownItems,
                            onChanged: (String? newValue) {
                              if (newValue == 'Clear Filter') {
                                allItemsController.selectedDate = '';
                              } else {
                                allItemsController.selectedDate = newValue!;
                              }

                              if (allItemsController.selectedStatus == 'All' &&
                                  allItemsController.selectedDate.isEmpty) {
                                allItemsController.fetchAllOrders();
                              } else if (allItemsController.selectedStatus == 'All' &&
                                  allItemsController.selectedDate.isNotEmpty) {
                                allItemsController.fetchOrdersByDate(allItemsController.selectedDate);
                              } else if (allItemsController.selectedStatus != 'All' &&
                                  allItemsController.selectedDate.isNotEmpty) {
                                allItemsController.fetchOrdersByStatusAndDate(
                                    allItemsController.selectedStatus, allItemsController.selectedDate);
                              } else {
                                allItemsController.fetchOrdersByStatus(allItemsController.selectedStatus);
                              }
                            },
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: height_520,
                  width: width_340,
                  child: TabBarView(
                    children: <Widget>[
                      for (int i = 0; i < 4; i++)
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius_10)),
                          child: Obx(() {
                            final List<AllOrdersModel> orders = allItemsController.searchQuery.isEmpty
                                ? allItemsController.ordersList
                                : allItemsController.searchedOrdersList;
                            return allItemsController.isLoading.isTrue
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
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// class AllItemScreen extends GetView<AllItemController> {
//   AllItemScreen({super.key});
//
//   AllItemController allItemsController = Get.put(AllItemController());
//
//
// }

// Obx(() => allItemsController.isLoading.isTrue
//         ? const Center(
//             child: CircularProgressIndicator(
//             color: AppColors.orange,
//           ))
//         : ListView.builder(
//             itemCount: allItemsController.ordersList.length,
//             itemBuilder: (context, index) {
//               AllOrdersModel order = allItemsController.ordersList[index];
//               String orderToken = order.orderToken.toString();
//               String senderName = order.senderName.toString();
//               String receiverName = order.receiverName.toString();
//               String productName = order.itemName.toString();
//               String dateAndTime = order.date.toString();
//               String status = order.status.toString();
//               Color buttonColor;
//               Color bgColor = AppColors.white;
//
//               if (status.toLowerCase() == 'pickup pending') {
//                 buttonColor = AppColors.yellow;
//               } else if (status.toLowerCase() == 'completed') {
//                 buttonColor = AppColors.orange;
//               } else {
//                 buttonColor = AppColors.blue;
//               }
//
//               return Padding(
//                 padding: const EdgeInsets.all(8),
//                 child: InkWell(
//                   onTap: () {
//                     Get.to(const CompleteOrdersScreen());
//                   },
//                   child: ShippingChip(
//                     orderUidNo: orderToken,
//                     senderName: senderName,
//                     recieverName: receiverName,
//                     productName: productName,
//                     time: dateAndTime,
//                     buttonColor: buttonColor,
//                     buttonName: status,
//                     bgColor: bgColor,
//                   ),
//                 ),
//               );
//             },
//           )
//     // Column(
//     //         children: [
//     //           InkWell(
//     //             onTap: () {
//     //               Get.to(const CompleteOrdersScreen());
//     //             },
//     //             child: const ShippingChip(
//     //               orderUidNo: '#CG5462JI',
//     //               senderName: 'Mack Smith',
//     //               recieverName: 'Mizan Umair',
//     //               productName: 'Flower Vase',
//     //               time: 'Mar 16, 2023 / 05:47 PM',
//     //               buttonColor: AppColors.orange,
//     //               buttonName: strComplete,
//     //               bgColor: AppColors.white,
//     //             ),
//     //           ),
//     //           const ShippingChip(
//     //             orderUidNo: '#CG5462JI',
//     //             senderName: 'Mack Smith',
//     //             recieverName: 'Mizan Umair',
//     //             productName: 'Flower Vase',
//     //             time: 'Mar 16, 2023 / 05:47 PM',
//     //             buttonColor: AppColors.blue,
//     //             buttonName: strDelivered,
//     //             bgColor: AppColors.white,
//     //           ),
//     //           InkWell(
//     //             onTap: () {
//     //               Get.to(PendingDetailsScreen());
//     //             },
//     //             child: ShippingChip(
//     //               orderUidNo: '#CG5462JI',
//     //               senderName: 'Mack Smith',
//     //               recieverName: 'Mizan Umair',
//     //               productName: 'Flower Vase',
//     //               time: 'Mar 16, 2023 / 05:47 PM',
//     //               buttonColor: AppColors.yellow,
//     //               buttonName: strPickupPending,
//     //               bgColor: AppColors.white,
//     //             ),
//     //           ),
//     //           for (int i = 0; i < 10; i++)
//     //             ShippingChip(
//     //               orderUidNo: '#CG5462JI',
//     //               senderName: 'Mack Smith',
//     //               recieverName: 'Mizan Umair',
//     //               productName: 'Flower Vase',
//     //               time: 'Mar 16, 2023 / 05:47 PM',
//     //               buttonColor: AppColors.redColor,
//     //               buttonName: strDelPending,
//     //               bgColor: AppColors.white,
//     //             ),
//     //         ],
//     //       ),
//     ),

//future builder

// FutureBuilder<List<AllOrdersModel>>(
//   future: allItemsController.fetchAllOrders(),
//   builder: (BuildContext context, AsyncSnapshot<List<AllOrdersModel>> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return const Center(
//         child: CircularProgressIndicator(
//           color: AppColors.orange,
//         ),
//       );
//     } else if (snapshot.hasData) {
//       return ListView.builder(
//         itemCount: allItemsController.ordersList.length,
//         itemBuilder: (context, index) {
//           AllOrdersModel order = allItemsController.ordersList[index];
//           String orderToken = order.orderToken.toString();
//           String senderName = order.senderName.toString();
//           String receiverName = order.receiverName.toString();
//           String productName = order.itemName.toString();
//           String dateAndTime = order.date.toString();
//           String status = order.status.toString();
//           Color buttonColor;
//           Color bgColor = AppColors.white;
//
//           if (status.toLowerCase() == 'pickup pending') {
//             buttonColor = AppColors.yellow;
//           } else if (status.toLowerCase() == 'completed') {
//             buttonColor = AppColors.orange;
//           } else {
//             buttonColor = AppColors.blue;
//           }
//
//           return Padding(
//             padding: const EdgeInsets.all(8),
//             child: InkWell(
//               onTap: () {
//                 Get.to(const CompleteOrdersScreen());
//               },
//               child: ShippingChip(
//                 orderUidNo: orderToken,
//                 senderName: senderName,
//                 recieverName: receiverName,
//                 productName: productName,
//                 time: dateAndTime,
//                 buttonColor: buttonColor,
//                 buttonName: status,
//                 bgColor: bgColor,
//               ),
//             ),
//           );
//         },
//       );
//     } else {
//       return const Center(
//         child: Text('An Error Occurred'),
//       );
//     }
//   },
// ),
