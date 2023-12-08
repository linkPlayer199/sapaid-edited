import 'package:sapaid/constants/app_libraries.dart';

class TermsAndConditionsController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();
  String termsandConditions = '';

  @override
  void onReady() async {
    
    isLoading = false;
    update();
    super.onReady();
  }

}
