import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/authentication/forgetpassword/forget_email_controller.dart';

class ForgetEmailScreen extends StatelessWidget {
  const ForgetEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: 'Forget Password',
          leading: CommonIconButton(
              iconData: Icons.chevron_left,
              color: AppColors.blackButtoncolor,
              isButton: true,
              onPressed: () {
                Get.offAllNamed(AppRoutes.login);
              }),
        ),
        resizeToAvoidBottomInset: false,
        body: bodyData(context));
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<ForgetEmailController>(
        init: ForgetEmailController(),
        builder: (_) {
          return _.isLoading
              ? const IsLoading()
              : Form(
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
                                text: "Forget Password",
                                fontFamily: 'Rubik',
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                                fontSize: 30,
                              ),
                              const MyText(
                                text:
                                    "Enter your email you entered when \ncreating account.",
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
                        text: "Phone Number",
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                        fontSize: 14,
                      ).marginOnly(left: 20, top: 30),
                      CommonTextField(
                        controller: _.emailController,
                        hintText: "Enter Phone",
                        isRequired: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Phone Number";
                          }
                          return null;
                          // Pattern pattern =
                          //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          // var regex = RegExp(pattern as String);
                          // return (!regex.hasMatch(value))
                          //     ? 'Please enter valid email'
                          //     : null;
                        },
                        prefixIcon: Icons.email_outlined,
                      ).marginOnly(top: 7, left: 10),
                      Spacer(),
                      Center(
                        child: CommonButton(
                          text: "Continue",
                          onPressed: () async {
                            if (_.validateAndSaveUser()) {
                              Get.toNamed(AppRoutes.forgetPassword);
                            }
                          },
                        ).marginOnly(top: 30, bottom: 50),
                      ),
                    ],
                  ).marginOnly(left: 20, right: 20),
                );
        });
  }
}
