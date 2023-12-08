import 'package:sapaid/constants/app_libraries.dart';

class ForgetPasswordController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();

  TextEditingController otpController = TextEditingController();

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }
}
