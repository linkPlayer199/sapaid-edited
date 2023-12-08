import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/splash/splash_controller.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyData(context),
    );
  }

  // -------------------------------  MAIN WIDGET ------------------------------------------

  Widget bodyData(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (_) {
          return Container(
            color: AppColors.primaryColor,
            height: Get.height,
            width: Get.width,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Spacer(),
              AnimatedRotation(
                turns: _.turns,
                duration: const Duration(seconds: 3),
                child: Image.asset(
                  AppAssets.applogotransparent,
                  fit: BoxFit.contain,
                  height: 100,
                ),
              ).marginOnly(bottom: 40),
              ProgressBarAnimation(
                width: Get.width / 2.5,
                height: 3,
                duration: const Duration(seconds: 3),
                gradient: LinearGradient(
                  colors: [
                    AppColors.whitecolor,
                    AppColors.whitecolor.withOpacity(0.9),
                  ],
                ),
                backgroundColor: Colors.grey.withOpacity(0.4),
              ),
              const Spacer(),
              const MyText(
                text: 'SAPAID',
                fontFamily: 'Poppins',
                color: AppColors.whitecolor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ).marginOnly(bottom: 30)
            ]),
          );
        });
  }
}
