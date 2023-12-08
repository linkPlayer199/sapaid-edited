import 'package:sapaid/constants/app_libraries.dart';

class SettingController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();

  @override
  void onReady() async {
    // await navigatetohome();
    isLoading = false;
    update();
    super.onReady();
  }
}
