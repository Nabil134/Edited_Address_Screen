import 'package:get/get.dart';

class ListController extends GetxController {
  var selectedIndex = 1.obs;

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
