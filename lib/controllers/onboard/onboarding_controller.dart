import 'package:sapaid/constants/app_libraries.dart';

class OnBoardingController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();

  @override
  void onReady() async {
    // await navigatetohome();
    isLoading = false;
    update();
    super.onReady();
  }

  Future<void> navigatetohome() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(AppRoutes.login);
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
