import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/wallet/wallet_controller.dart';

class Addcard extends StatelessWidget {
  const Addcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        centertitle: false,
        title: 'Add Card',
        // leading: CommonIconButton(
        //   iconData: Icons.chevron_left,
        //   color: AppColors.blackButtoncolor,
        //   isButton: true,
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
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
          _.cardHolderName = 'huhjhjk'.toUpperCase();
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
              Center(
                child: Container(

                    height: MediaQuery.of(context).size.height*0.2,
                    child: Image.asset(AppAssets.amico)),
              ).marginOnly(top: 32)
               , Center(child: Text("Start using cards for your transactions today? With convenience, security, and organization at your fingertips, you'll wonder how you ever managed without them.", style: TextStyle(fontSize: 15),),).marginOnly(left: 21, right: 22, top: 24)
            ,

            Center(child: CommonButton(text: 'Add Card', onPressed: (){})).marginOnly(top: 60)
            ],
          );
        });
  }
}
