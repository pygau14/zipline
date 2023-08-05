import 'package:get/get.dart';

import '../../../core/constants/strings.dart';

class AddOrderController extends GetxController{
  // List<Steps> getStep => [
  // Step(title: 'title', content: Container())
  // ];

  final List<String> dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  final List<String> dropdownCateg = ['Beam', 'Force', 'Clear'];
  String? selectedValue=strSelectItemType;

}