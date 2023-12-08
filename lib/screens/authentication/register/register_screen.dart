import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/authentication/register/register_controller.dart';
import 'package:sapaid/widgets/common_snackbar_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: bodyData(context));
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<RegisterController>(
        init: RegisterController(),
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                  text: "Create Account",
                                  fontFamily: 'Rubik',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                  fontSize: 30,
                                ),
                                const MyText(
                                  text:
                                      "Fill the form to create a Individual account",
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.textColor,
                                  fontSize: 14,
                                ).marginOnly(top: 5, bottom: 20),
                              ],
                            ),
                            const Spacer(),
                            Image.asset(
                              AppAssets.appsecondarylogo,
                              height: 50,
                            ),
                          ],
                        ),
                        const MyText(
                          text: "Full Name",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ).marginOnly(left: 20, top: 20),
                        CommonTextField(
                          controller: _.fullNameController,
                          hintText: "Enter Full Name",
                          isRequired: false,
                          prefixIcon: Icons.badge_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Full Name";
                            }
                            return null;
                          },
                        ).marginOnly(
                          top: 7,
                          left: 10,
                        ),
                        const MyText(
                          text: "UserName",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ).marginOnly(left: 20, top: 20),
                        CommonTextField(
                          controller: _.userNameController,
                          hintText: "Enter UserName",
                          isRequired: false,
                          prefixIcon: Icons.person_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter UserName";
                            }
                            return null;
                          },
                        ).marginOnly(
                          top: 7,
                          left: 10,
                        ),
                        const Row(
                          children: [
                            MyText(
                              text: "Avaiable: ",
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                              fontSize: 12,
                            ),
                            MyText(
                              text: "Test123",
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                              fontSize: 12,
                            ),
                          ],
                        ).marginOnly(left: 20, top: 5),
                        const MyText(
                          text: "Email",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ).marginOnly(left: 20, top: 20),
                        CommonTextField(
                          controller: _.emailController,
                          hintText: "Enter Email",
                          isRequired: false,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Email";
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
                          text: "Phone Number",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ).marginOnly(left: 20, top: 20),
                        CommonTextField(
                          controller: _.phoneController,
                          hintText: "Enter Phone Number",
                          isRequired: false,
                          prefixIcon: Icons.phone_iphone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Phone Number";
                            }
                            return null;
                          },
                        ).marginOnly(
                          top: 7,
                          left: 10,
                        ),
                        const MyText(
                          text: "Password",
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ).marginOnly(left: 20, top: 20),
                        CommonTextField(
                          controller: _.passwordController,
                          hintText: "Enter your password",
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
                        Row(
                          children: [
                            Checkbox(
                              side: const BorderSide(
                                  color: AppColors.primaryColor),
                              fillColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                      (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.transparent;
                                }
                                return AppColors.textFieldBorderColor;
                              }),
                              value: _.termsandPolicy,
                              onChanged: (value) {
                                _.termsandPolicy = value!;
                                _.update();
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          text: "I agree to the ",
                                          fontFamily: 'Poppins',
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.terms);
                                          },
                                          child: const MyText(
                                            text: "Terms And Conditions",
                                            fontFamily: 'Poppins',
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const MyText(
                                          text: "& ",
                                          fontFamily: 'Poppins',
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.privacy);
                                          },
                                          child: const MyText(
                                            text: "Privacy Policy ",
                                            fontFamily: 'Poppins',
                                            color: AppColors.primaryColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const MyText(
                                          text: "before creating account",
                                          fontFamily: 'Poppins',
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ).marginOnly(top: 20, bottom: 20),
                        Center(
                          child: CommonButton(
                            text: "Create Account",
                            onPressed: () async {
                              if (_.validateAndSaveUser()) {
                                if (_.termsandPolicy == false) {
                                  CommonSnackBar.showSnackBar(
                                      isWarning: true,
                                      title:
                                          "Please accept the Terms and Conditions");
                                } else {
                                  Get.toNamed(AppRoutes.verifyOTP);
                                }
                              }
                            },
                          ).marginOnly(top: 30, bottom: 10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account? ",
                                style: GoogleFonts.poppins(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                            GestureDetector(
                              onTap: () {
                                Get.offAllNamed(AppRoutes.login);
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                    color: AppColors.primaryColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ).marginOnly(left: 20, right: 20, top: 70, bottom: 40),
                  ),
                );
        });
  }
}
