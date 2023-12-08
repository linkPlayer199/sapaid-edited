import 'package:sapaid/constants/app_libraries.dart';

class PrivacyPolicyController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();
  String privacyPolicy = '';

  @override
  void onReady() async {
   
    isLoading = false;
    update();
    super.onReady();
  }

 
}
