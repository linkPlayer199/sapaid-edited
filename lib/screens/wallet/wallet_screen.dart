import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/wallet/wallet_controller.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        centertitle: false,
        title: 'Wallet',
        leading: CommonIconButton(
          iconData: Icons.chevron_left,
          color: AppColors.blackButtoncolor,
          isButton: true,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Image.asset(
            AppAssets.appsecondarylogo,
            fit: BoxFit.contain,
          ).marginAll(12)
        ],
      ),
      body: bodyData(context),
    );
  }

  // ------------------- MAIN WIDGET -----------------------------

  Widget bodyData(BuildContext context) {
    return GetBuilder<WalletController>(
        init: WalletController(),
        builder: (_) {
          _.cardNumber = '1234123412341234';
          _.cvcCode = '123';
          _.cardHolderName = 'Moeez Suleman'.toUpperCase();
          _.expiryDate = '11/25';
          return _.isLoading
              ? const IsLoading()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CreditCardWidget(
                      cardNumber: _.cardNumber,
                      expiryDate: _.expiryDate,
                      cardHolderName: _.cardHolderName,
                      cvvCode: _.cvcCode,
                      showBackView: _.isCvcFocused,
                      obscureCardNumber: true,
                      obscureCardCvv: true,
                      isHolderNameVisible: true,
                      cardBgColor: AppColors.primaryColor,
                      isSwipeGestureEnabled: true,
                      onCreditCardWidgetChange:
                          (CreditCardBrand creditCardBrand) {},
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const MyText(
                              text: 'Top Up Amount',
                              fontFamily: 'Poppins',
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                            CommonTextField(
                                    hintText: 'Enter Top Up Amount',
                                    fillcolor: AppColors.whitecolor,
                                    keyboardType: TextInputType.number,
                                    controller: _.topUpAmountController)
                                .marginSymmetric(vertical: 10),
                            const MyText(
                              text:
                                  '*This amount will be deducted from your card connected*',
                              fontFamily: 'Poppins',
                              color: AppColors.blackButtoncolor,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        )),
                        Container(
                          // height: 50,
                          padding: const EdgeInsets.all(18),
                          width: 70,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Center(
                              child: MyText(
                            text: 'Add',
                            fontFamily: 'Poppins',
                            color: AppColors.whitecolor,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          )),
                        ).marginSymmetric(horizontal: 5),
                      ],
                    ).marginSymmetric(horizontal: 20),
                    const MyText(
                      text: 'Your Recent Credits',
                      fontFamily: 'Poppins',
                      color: AppColors.blackButtoncolor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ).marginSymmetric(vertical: 10, horizontal: 20),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                          color: AppColors.whitecolor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: Colors.grey,
                          height: 1,
                          endIndent: 20,
                          indent: 20,
                        ).marginSymmetric(vertical: 5),
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: AppColors.lightgreyColor,
                              child: CommonIconButton(
                                iconData: Icons.wallet,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            title: RichText(
                              text: const TextSpan(
                                  text: 'You have been credit ',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 13),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '\u0024 100',
                                      style: TextStyle(
                                          color: AppColors.lightgreenColor,
                                          fontSize: 13,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600),
                                    )
                                  ]),
                            ),
                            subtitle: Row(
                                // mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const MyText(
                                    text: 'Dated: ',
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.blackButtoncolor,
                                  ),
                                  MyText(
                                    text: '2022-20-10 ',
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textFieldBorderColor,
                                  ),
                                ]).marginOnly(top: 10),
                          );
                        },
                      ),
                    ).marginSymmetric(horizontal: 20, vertical: 10))
                  ],
                );
        });
  }
}
