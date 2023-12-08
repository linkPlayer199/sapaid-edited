import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/authentication/forgetpassword/new_password_controller.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: bodyData(context));
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<NewPasswordController>(
        init: NewPasswordController(),
        builder: (_) {
          return _.isLoading
              ? const IsLoading()
              : Form(
                  key: _.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          AppAssets.applogo,
                          height: 100,
                        ).marginOnly(bottom: 40),
                      ),
                      const MyText(
                        text: "Create New Password",
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor,
                        fontSize: 26,
                      ),
                      const MyText(
                        text:
                            "Please fill the below fields to reset your password",
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        fontSize: 14,
                      ).marginOnly(top: 5, bottom: 40),
                      const MyText(
                        text: "Password",
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        fontSize: 14,
                      ).marginOnly(left: 20, top: 20),
                      CommonTextField(
                        controller: _.passwordController,
                        hintText: "Enter Password",
                        isRequired: false,
                        prefixIcon: Icons.lock_outline,
                        maxlines: 1,
                        togglePassword: true,
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Password Length should be atleast 8 character";
                          }
                          return null;
                        },
                        isTextHidden: _.passwordshown,
                        toggleIcon: _.passwordshown == true
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                        toggleFunction: () {
                          _.passwordshown = !_.passwordshown;
                          _.update();
                        },
                      ).marginOnly(top: 7, left: 10, bottom: 10),
                      const MyText(
                        text: "Confirm Password",
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        fontSize: 14,
                      ).marginOnly(left: 20, top: 20),
                      CommonTextField(
                        controller: _.confirmPasswordController,
                        hintText: "Enter Password",
                        isRequired: false,
                        prefixIcon: Icons.lock_outline,
                        maxlines: 1,
                        togglePassword: true,
                        validator: (value) {
                          if (value!.length < 8) {
                            return "Password Length should be atleast 8 character";
                          }
                          return null;
                        },
                        isTextHidden: _.passwordshown1,
                        toggleIcon: _.passwordshown1 == true
                            ? Icons.visibility_off_outlined
                            : Icons.remove_red_eye_outlined,
                        toggleFunction: () {
                          _.passwordshown1 = !_.passwordshown1;
                          _.update();
                        },
                      ).marginOnly(top: 7, left: 10, bottom: 10),
                      Center(
                        child: CommonButton(
                          text: "Submit",
                          onPressed: () async {
                            if (_.validateAndSaveUser()) {
                              if (_.passwordController.text !=
                                  _.confirmPasswordController.text) {
                                showMotionToast(
                                    type: ToastType.warning,
                                    context: context,
                                    description:
                                        "Password and Confirm Password does not match");
                              } else {
                                Get.offAllNamed(AppRoutes.login);
                                CommonSnackBar.showSnackBar(
                                    title: 'Password Changed Successfully',
                                    isWarning: false);
                              }
                            }
                          },
                        ).marginOnly(top: 30, bottom: 10),
                      ),
                    ],
                  ).marginOnly(left: 20, right: 20),
                );
        });
  }
}
