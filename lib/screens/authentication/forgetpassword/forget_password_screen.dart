import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/authentication/forgetpassword/forget_password_controller.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
        title: 'Verify OTP',
        leading: CommonIconButton(
            iconData: Icons.chevron_left,
            color: AppColors.blackButtoncolor,
            isButton: true,
            onPressed: () {
              Get.back();
            }),
      ),
      body: bodyData(context),
    );
  }

  // ------------------------------ MAIN WIDGET -----------------------------------

  Widget bodyData(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
        init: ForgetPasswordController(),
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  AppAssets.otpverification,
                  height: 250,
                ),
              ).marginOnly(top: 20, bottom: 30),
              const MyText(
                text: 'Verify Your Phone Number',
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.blackButtoncolor,
              ),
              const MyText(
                text: 'Verification code sent to  +1 (234) 567 8900.',
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.blackButtoncolor,
              ).marginOnly(top: 5, bottom: 20),
              PinCodeTextField(
                length: 4,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: AppColors.primaryColor,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  inactiveFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  activeColor: const Color(0xffF6F6F6),
                  inactiveColor: AppColors.primaryColor,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: const Color(0xffF6F6F6),
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                controller: _.otpController,
                onCompleted: (v) {
                  Get.log("Completed");
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  Get.log("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
                appContext: context,
              ).marginSymmetric(horizontal: 60, vertical: 20),
              const MyText(
                text:
                    'If you didn’t receive the code. Please click \nresend below.',
                fontFamily: 'Poppins',
                color: AppColors.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              const MyText(
                text: 'RESEND',
                fontFamily: 'Poppins',
                color: AppColors.primaryColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ).marginOnly(top: 5),
              const Spacer(),
              Center(
                child: CommonButton(
                    text: 'Verify',
                    onPressed: () {
                      if (_.otpController.text.length < 4) {
                        showMotionToast(
                            type: ToastType.error,
                            context: context,
                            description:
                                "Please Enter 4-Digits Otp sent to your phone number");
                      } else {
                        CommonSnackBar.showSnackBar(
                            title: 'OTP Verified Successfully',
                            isWarning: false);
                        Get.offAllNamed(AppRoutes.newPassword);
                      }
                    }).marginOnly(bottom: 40),
              )
            ],
          ).marginSymmetric(horizontal: 20);
        });
  }
}
