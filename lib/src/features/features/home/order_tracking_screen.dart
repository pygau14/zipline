import 'package:courier_app/src/components/custom_sender.dart';
import 'package:courier_app/src/core/constants/dimensions.dart';
import 'package:courier_app/src/core/constants/palette.dart';
import 'package:courier_app/src/features/features/item_details/details_controller.dart';
import 'package:courier_app/src/features/features/item_details/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/custom_appbar.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_senderr.dart';
import '../../../core/constants/assets.dart';
import '../../../core/constants/strings.dart';

class OrderTrackingScreen extends StatefulWidget {
  final OrderDetailsModel order;

  const OrderTrackingScreen({super.key, required this.order});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  DetailsController orderDetailsController = Get.put(DetailsController());

  Color buttonColor = AppColors.orange;
  String buttonTitle = 'Completed';

  // if (order.status == 'completed') {
  // Get.to(() => CompleteOrdersScreen(
  // orderToken: orderToken,
  // ));
  // } else if (status == 'delivered') {
  // Get.to(() => DeliveredOrdersScreen(
  // orderToken: orderToken,
  // ));
  // } else if (status == 'pickup pending') {
  // Get.to(() => PendingDetailsScreen(
  // orderToken: orderToken,
  // ));
  // } else if (status == 'delivery pending') {}
  //
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String status = widget.order.status.toString().toLowerCase();
    return Scaffold(
      appBar: CustomAppbar(
        appBar: AppBar(),
        title: strItemDetail,
        containerColor: status == 'completed'
            ? AppColors.orange
            : status == 'delivered'
                ? AppColors.blue
                : status == 'pickup pending'
                    ? AppColors.yellow
                    : AppColors.yellow,
        text: status == 'completed'
            ? strComplete
            : status == 'delivered'
                ? strDelivered
                : status == 'pickup pending'
                    ? strPickupPending
                    : 'Delivery Pending',
        color: AppColors.white,
        onPress: () {},
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
              name: widget.order.senderName.toString(),
              contact: widget.order.senderContactNo.toString(),
              email: widget.order.senderEmailAddress.toString(),
              address: widget.order.senderAddress.toString(),
              heading: strAboutPack,
            ),
            CustomDivider(
              height: height_25,
              isDivider: false,
            ),
            CustomSenderDetails(
              name: widget.order.receiverName.toString(),
              contact: widget.order.receiverContactNo.toString(),
              email: widget.order.receiverEmailAddress.toString(),
              address: widget.order.receiverAddress.toString(),
              heading: strRecieverInfo,
            ),
            CustomDivider(
              height: height_25,
              isDivider: false,
            ),
            CustomSender(
                name: widget.order.itemName.toString(),
                size: widget.order.itemSize.toString(),
                imgText: widget.order.itemImageUrl.toString(),
                weight: widget.order.itemWeight.toString(),
                types: widget.order.itemType.toString(),
                category: widget.order.itemCategory.toString(),
                delivery: widget.order.deliveryRequired.toString(),
                charges: widget.order.charges.toString(),
                heading: strPackageDetails),
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

/*

String orderStatus = snapshot.data!.status.toString();
        String orderId = snapshot.data!.orderId.toString();
    String senderName = snapshot.data!.senderName.toString();
    String senderContact = snapshot.data!.senderContactNo.toString();
    String senderEmail = snapshot.data!.senderEmailAddress.toString();
    String senderAddress = snapshot.data!.senderAddress.toString();
    String receiverName = snapshot.data!.receiverName.toString();
    String receiverContact = snapshot.data!.receiverContactNo.toString();
    String receiverEmail = snapshot.data!.receiverEmailAddress.toString();
    String receiverAddress = snapshot.data!.receiverAddress.toString();
    String itemName = snapshot.data!.itemName.toString();
    String itemImageUrl = snapshot.data!.itemImageUrl.toString();
    String itemSize = snapshot.data!.itemSize.toString();
    String itemWeight = snapshot.data!.itemWeight.toString();
    String itemType = snapshot.data!.itemType.toString();
    String itemCategory = snapshot.data!.itemCategory.toString();
    String itemDeliveryRequired = snapshot.data!.deliveryRequired.toString() == '1' ? 'Yes' : 'No';
    String itemCharges = snapshot.data!.charges.toString();


 */
