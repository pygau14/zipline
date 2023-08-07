import 'dart:convert';

import 'package:courier_app/src/features/auth/auth/preferences_service.dart';
import 'package:courier_app/src/features/features/all_item/all_orders_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../core/constants/user_constants.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;
  SharedPreferences prefs = PreferencesService.instance;
  RxList<AllOrdersModel> ordersList = RxList<AllOrdersModel>([]);

  Future<List<AllOrdersModel>> fetchAllOrders() async {
    try {
      isLoading.value = true;
      final userId = prefs.getInt(UserContants.userId) ?? -1;
      final url = 'https://courier.hnktrecruitment.in/fetch-recent-user-orders/$userId';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('All Orders Fetched');

        final dynamic responseData = jsonDecode(response.body.toString());
        if (responseData is List) {
          final jsonData = jsonDecode(response.body.toString()) as List;
          final List<AllOrdersModel> orders = jsonData.map((item) => AllOrdersModel.fromJson(item)).toList();
          Fluttertoast.showToast(msg: "Fetched Recent Orders", timeInSecForIosWeb: 20);
          ordersList.assignAll(orders);
        } else if (responseData is Map && responseData.containsKey('message')) {
          print('No data available: ${responseData['message']}');
          ordersList.clear();
        } else {
          print('Invalid response format.');
        }
      } else {
        Fluttertoast.showToast(
            msg: "Failed to load orders, Error Code: ${response.statusCode}", timeInSecForIosWeb: 20);
        ordersList.clear();
        print('Failed to load orders: ${response.statusCode}');
      }
    } on Exception catch (e) {
      ordersList.clear();
      Fluttertoast.showToast(msg: "Failed to load orders, Error: ${e.toString()}", timeInSecForIosWeb: 20);
    } finally {
      isLoading.value = false;
    }

    return ordersList;
  }
}
