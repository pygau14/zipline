import 'dart:convert';

import 'package:courier_app/src/core/constants/user_constants.dart';
import 'package:courier_app/src/features/auth/auth/preferences_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/strings.dart';
import 'package:http/http.dart' as http;

class AddOrderController extends GetxController {
  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> dropdownCateg = ['Beam', 'Force', 'Clear'];
  String? selectedValue = strSelectItemType;

  RxBool isLoading = false.obs;

  // List<Steps> getStep => [
  // Step(title: 'title', content: Container())
  // ];
  final SharedPreferences prefs = PreferencesService.instance;
  int orderId = -1;

  Future<bool> addSenderDetails(String senderName, String contactNum, String emailAddress, String doorFlatNum,
      String streetAreaName, String cityTown, String pincode) async {
    isLoading.value = true;
    bool isOrderAdded = false;

    final url = Uri.parse('https://courier.hnktrecruitment.in/add-order');
    final body = jsonEncode({
      'user_id': prefs.getInt(UserContants.userId),
      'name': senderName,
      'contact_no': contactNum,
      'email_address': emailAddress,
      'door_flat_no': doorFlatNum,
      'street_area_name': streetAreaName,
      'city_town': cityTown,
      'pincode': pincode,
    });

    try {
      final response = await http.post(
        url,
        body: body,
        headers: {'Content-Type': 'application/json'},
      );

      final data = response.body.toString();
      final jsonData = jsonDecode(data);

      if (response.statusCode == 200) {
        isOrderAdded = true;
        orderId = jsonData['orderId'];
        Fluttertoast.showToast(msg: jsonData['message'], timeInSecForIosWeb: 20);
      } else {
        isOrderAdded = false;
        Fluttertoast.showToast(msg: jsonData['error']);
      }
    } on Exception catch (e) {
      Fluttertoast.showToast(msg: 'Error: ${e.toString()}');
    }
    isLoading.value = false;
    return isOrderAdded;
  }
}
