import 'package:sapaid/constants/app_libraries.dart';

class AllBenificiaryController extends GetxController {
  bool isLoading = true;
  

  @override
  void onReady() async {
   
    isLoading = false;
    update();
    super.onReady();
  }

 
}
