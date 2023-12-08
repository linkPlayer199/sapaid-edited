import 'dart:collection';

import 'package:sapaid/constants/app_libraries.dart';

class DashboardController extends GetxController {
  String deviceToken = '';
  bool isLoading = true;

  @override
  void onReady() async {
    // await userController.fetchUserDetails();
    isLoading = false;
    update();
    super.onReady();
  }

  var currentindex = 0.obs;
  ListQueue<int> navigationQueue = ListQueue();

  void checkRedirect(int index) {
    // ignore: unnecessary_null_comparison
    if (index != null) {
      currentindex.value = index;
    }
  }

  void changeTabIndex(int index) {
    Get.log("Current Indexx is $index");
    currentindex.value = index;

    // ignore: unrelated_type_equality_checks
    if (index == currentindex) {
      navigationQueue.clear();
      // navigationQueue.removeWhere((element) => element == index);
      navigationQueue.addLast(index);
      currentindex.value = index;
      update();
    }
    update();
    checkdata();
  }

  void checkdata() {
    // ignore: avoid_function_literals_in_foreach_calls
    navigationQueue.forEach((element) {});
  }
}
