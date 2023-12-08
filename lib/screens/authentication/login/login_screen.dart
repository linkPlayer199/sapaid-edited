import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/authentication/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: bodyData(context));
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<SignInController>(
        init: SignInController(),
        builder: (_) {
          return _.isLoading
              ? const IsLoading()
              : SingleChildScrollView(
                  child: Form(
                    key: _.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Image.asset(
                            AppAssets.applogo,
                            height: 100,
                          ).marginOnly(top: 40, bottom: 40),
                        ),
                        const MyText(
                          text: "Login",
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          color: AppColors.primaryColor,
                          fontSize: 30,
                        ),
                        const MyText(
                          text: "Please Login In to your account",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ).marginOnly(top: 5, bottom: 40),
                        MyText(
                          text: "Email",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 14,
                        ).marginOnly(left: 20),
                        CommonTextField(
                          controller: _.emailController,
                          hintText: "Enter Email",
                          isRequired: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter email";
                            }
                            Pattern pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            var regex = RegExp(pattern as String);
                            return (!regex.hasMatch(value))
                                ? 'Please enter valid email'
                                : null;
                          },
                          prefixIcon: Icons.email_outlined,
                        ).marginOnly(top: 7, left: 10),
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
                        Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.offAllNamed(AppRoutes.forgetPasswordEmail);
                            },
                            child: const MyText(
                              text: "Forget Password?",
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ).marginOnly(right: 10),
                          ),
                        ),
                        Center(
                          child: CommonButton(
                            text: "Login",
                            onPressed: () {
                              if (_.validateAndSaveUser()) {
                                Get.offAllNamed(AppRoutes.dashboard);
                              }
                            },
                          ).marginOnly(top: 30, bottom: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                            GestureDetector(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.register);
                              },
                              child: Text(
                                "Create one now",
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Flexible(
                                child: Divider(
                              indent: 30,
                              color: AppColors.blackButtoncolor,
                            )),
                            MyText(
                              text: "OR".toUpperCase(),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 14,
                            ).marginSymmetric(horizontal: 15),
                            const Flexible(
                                child: Divider(
                              color: AppColors.blackButtoncolor,
                              endIndent: 30,
                            )),
                          ],
                        ).marginSymmetric(vertical: 20),
                        Center(
                          child: const MyText(
                            text: "Login using Touch ID",
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                            fontSize: 14,
                          ).marginOnly(bottom: 10),
                        ),
                        Center(
                          child: CommonIconButton(
                            //changed
                            iconData: Icons.fingerprint,
                            color: AppColors.primaryColor,
                            isButton: true,
                            onPressed: () {},
                            size: 60,
                          ),
                        ),
                      ],
                    ).marginOnly(left: 20, right: 20),
                  ),
                );
        });
  }
}
