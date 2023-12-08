import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/appinformation/privacy_controller.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Privacy Policy',
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.chevron_left,
              color: AppColors.blackButtoncolor,
            )),
      ),
      body: bodyData(context),
    );
  }

  // ------------------------------------------------ MAIN WIDGET -------------------------------------------------

  Widget bodyData(BuildContext context) {
    return GetBuilder<PrivacyPolicyController>(
        init: PrivacyPolicyController(),
        builder: (_) {
          return _.isLoading
              ? const IsLoading()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      MyText(
                        text: 'Lorem Ipsum is a dummy text',
                        fontFamily: 'Poppins',
                        color: AppColors.blackButtoncolor,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ).marginSymmetric(vertical: 20, horizontal: 20),
                );
        });
  }
}
