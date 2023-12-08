import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/authentication/login/login_controller.dart';

class LoginScreenNew extends StatelessWidget {
  LoginScreenNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: bodyData(context));
  }
List<String> data=['Single Agent','Individual User', "Special Agent"];
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
                    ).marginOnly(top: 100, bottom: 40),
                  ),
                  const MyText(
                    text: "Sign Up",
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontSize: 30,
                  ),
                  const MyText(
                    text: "Enter the phone number you want to  associate your  sapaid account",
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                    fontSize: 14,
                  ).marginOnly(top: 49, bottom: 40),
                  MyText(
                    text: "Select Option",
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 14,
                  ).marginOnly(left: 20),

                  CustomDropdown(
                    // expandedFillColor: Colors.blue,
                    closedFillColor: Colors.blue,
                    items: data, hintText: 'Select',).marginOnly(top: 10),

                ],
              ).marginOnly(left: 20, right: 20),
            ),
          );
        });
  }
}
