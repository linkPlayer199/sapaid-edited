// ignore: file_names
import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/onboard/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  // final Color kDarkBlueColor = const Color(0xFF053149);

  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<OnBoardingController>(
          init: OnBoardingController(),
          builder: (_) {
            return OnBoardingSlider(
              finishButtonText: 'Get Started',
              finishButtonTextStyle: TextStyle(
                color: AppColors.whitecolor,
                fontFamily: 'Poppins',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
              onFinish: () {
                Get.offAllNamed(AppRoutes.login);
              },
              finishButtonStyle: FinishButtonStyle(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
              skipTextButton: const MyText(
                text: 'SKIP',
                fontFamily: 'Poppins',
                fontSize: 14,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
              controllerColor: AppColors.primaryColor,
              totalPage: 3,
              headerBackgroundColor: Colors.white,
              pageBackgroundColor: Colors.white,
              background: [
                Image.asset(
                  AppAssets.moneytransfer,
                  height: 300,
                  // width: 300,
                  alignment: Alignment.center,
                ).marginSymmetric(horizontal: 60, vertical: 30),
                Image.asset(
                  AppAssets.qrscan,
                  height: 300,
                ).marginSymmetric(horizontal: 10, vertical: 30),
                Image.asset(
                  AppAssets.securepayment,
                  height: 300,
                  // fit: BoxFit.cover,
                ).marginOnly(left: 100, top: 70),
              ],
              speed: 1.8,
              pageBodies: [
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 480,
                      ),
                      Text(
                        'Money Transfer',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontFamily: 'Rubik',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'You can send money anywhere online and offline',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 480,
                      ),
                      Text(
                        'QR Payment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontFamily: 'Rubik',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Payments are possible just by QR Scan',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 480,
                      ),
                      Text(
                        'Secure Payment',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontFamily: 'Rubik',
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'You can transfer money to anyone securely',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
