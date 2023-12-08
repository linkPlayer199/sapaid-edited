import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/home/home_controller.dart';
import 'package:sapaid/screens/qrcode/qr_code_screen.dart';
import 'package:sapaid/widgets/common_container_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whitecolor,
        title: const MyText(
          letterSpacing: 1,
          text: 'SAPAID',
          fontFamily: 'PT Serif',
          color: AppColors.primaryColor,
          fontSize: 40,
          fontWeight: FontWeight.w900,
        ),
        // title: 'Add Card',
        // leading: const Drawer(),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(QRViewExample());
            },
            child: Image.asset(
              AppAssets.barcodescanner,
              fit: BoxFit.contain,
            ).marginAll(12),
          )
        ],
      ),
      body: bodyData(context),
    );
  }

  // ------------------- MAIN WIDGET -----------------------------

  Widget bodyData(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          _.cardNumber = 'Hi Jordan!';
          _.cvcCode = '123';
          _.cardHolderName = "Here's your Balance 100000";
          _.expiryDate = '11/25';
          return _.isLoading
              ? const IsLoading()
              : Column(
                  children: [
                    // CreditCardWidget(
                    //   cardNumber: _.cardNumber,
                    //   expiryDate: _.expiryDate,
                    //   cardHolderName: _.cardHolderName,
                    //   cvvCode: _.cvcCode,
                    //   showBackView: _.isCvcFocused,
                    //   obscureCardNumber: true,
                    //   obscureCardCvv: true,
                    //   isHolderNameVisible: true,
                    //   cardBgColor: AppColors.primaryColor,
                    //   isSwipeGestureEnabled: true,
                    //   onCreditCardWidgetChange:
                    //       (CreditCardBrand creditCardBrand) {},
                    // ),

                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(colors: [
                            AppColors.primaryColor,
                            AppColors.primaryColor.withOpacity(0.77)
                          ])),
                      width: Get.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const MyText(
                              text: 'Hi Santiago!',
                              fontFamily: 'Poppins',
                              color: AppColors.whitecolor,
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                            ),
                            const MyText(
                              text: "Here's your balance",
                              fontFamily: 'Poppins',
                              color: AppColors.whitecolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ).marginOnly(top: 10, bottom: 30),
                            const MyText(
                              text: '\u0024 100,0005,765,75',
                              fontFamily: 'Poppins',
                              color: AppColors.whitecolor,
                              fontWeight: FontWeight.w400,
                              fontSize: 32,
                            ),
                          ]).marginOnly(left: 20),
                    ).marginSymmetric(vertical: 20, horizontal: 20),
                    Expanded(
                      child: CommonContainerWithOutContent(
                          shadowColor: AppColors.primaryColor.withOpacity(0.2),
                          bgColor: const Color(0xffF6F6F6),
                          content: SizedBox(
                            width: Get.width,
                            height: Get.height / 2.0,
                            child: ListView(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const MyText(
                                    text: 'QUICK OPTIONS',
                                    fontFamily: 'Poppins',
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const MyText(
                                    text: 'Choose the Options you want to use',
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      quickOptions('Transfer',
                                              AppAssets.add_money, () {}, _)
                                          .marginSymmetric(vertical: 20),
                                      quickOptions('Add Payees',
                                          AppAssets.addbenificiary, () {}, _),
                                      quickOptions('Add Funds',
                                          AppAssets.add_funds, () {}, _),

                                    ],
                                  ),
                                  Text(" Add \$ View Agent"),
                                  Row(children: [
                                    quickOptions('Agent',
                                        AppAssets.add_money, () {}, _)
                                        .marginSymmetric(vertical: 20),
                                  ],),
                                  const Center(
                                    child: MyText(
                                      text:
                                          'Send or Recieve payment through QR code',
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: AppColors.blackButtoncolor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ).marginOnly(top: 20, bottom: 20),
                                  Center(
                                    child: SizedBox(
                                      height: 100,
                                      child: Image.asset(
                                        AppAssets.qrcode,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  )
                                ]).marginAll(12),
                          )).marginSymmetric(horizontal: 20),
                    )
                  ],
                );
        });
  }

  Widget quickOptions(
      String name, String icon, VoidCallback onPressed, HomeController _) {
    return Container(
      height: 115,
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.whitecolor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: AppColors.lightgreyColor,
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(
              icon,
              height: 30,
              color: AppColors.primaryColor,
              fit: BoxFit.contain,
            ).marginAll(12),
          ).marginOnly(bottom: 10),
          MyText(
            text: name,
            fontFamily: 'Poppins',
            fontSize: 14,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
