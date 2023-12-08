import 'package:sapaid/constants/app_libraries.dart';

class SplashController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();
  double turns = 0.0;

  void changeRotation() {
   turns += 1.0 / 8.0;
   update();
  }


  @override
  void onReady()  {
    changeRotation();
     navigatetohome();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> navigatetohome() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Get.offAllNamed(AppRoutes.onBoard);
    });
    update();

    // await Future.delayed(const Duration(seconds: 1), () {
    //   if (storage.hasData('Token')) {
    //     Get.offAllNamed(AppRoutes.dashboard);
    //   } else {
    //     Get.offAllNamed(AppRoutes.login);
    //   }
    // });
  }
}
