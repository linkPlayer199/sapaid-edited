import 'package:sapaid/constants/app_libraries.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:sapaid/controllers/creditcard/credit_card_controller.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCardController>(
        init: AddCardController(),
        builder: (_) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: CommonAppBar(
              title: 'Add Card',
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    color: AppColors.blackButtoncolor,
                  )),
              actions: [
                GestureDetector(
                  onTap: (){
                     Get.offAllNamed(AppRoutes.dashboard);
                  },
                  child: Center(
                    child: const MyText(
                      text: 'SKIP',
                      fontFamily: 'Poppins',
                      color: AppColors.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ).marginOnly(right: 10),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MyText(
                            text: "Add Card",
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                            fontSize: 28,
                          ),
                          const MyText(
                            text:
                                "Connect your card with SAPAID and make  \ntop-upfrom your card into SAPAID WALLET",
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                            fontSize: 12,
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
                  CreditCardWidget(
                    cardNumber: _.cardNumber,
                    expiryDate: _.expiryDate,
                    cardHolderName: _.cardHolderName,
                    cvvCode: _.cvvCode,
                    showBackView: _.isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: AppColors.primaryColor,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                  ),
                  CreditCardForm(
                    formKey: _.formKey,
                    obscureCvv: true,
                    obscureNumber: true,
                    cardNumber: _.cardNumber.toString(),
                    cvvCode: _.cvvCode,
                    isHolderNameVisible: true,
                    isCardNumberVisible: true,
                    isExpiryDateVisible: true,
                    cardHolderName: _.cardHolderName,
                    expiryDate: _.expiryDate,
                    themeColor: AppColors.primaryColor,
                    textColor: Colors.black,
                    cardNumberDecoration: commonInputDecoration(
                        hintText: 'XXXX XXXX XXXX XXXX',
                        labelText: 'Card  Number'),
                    expiryDateDecoration: commonInputDecoration(
                        hintText: 'XX / XX', labelText: 'Valid Till'),
                    cvvCodeDecoration: commonInputDecoration(
                        hintText: 'XXX', labelText: 'CVC'),
                    cardHolderDecoration: commonInputDecoration(
                        hintText: 'Enter Card Holder Name',
                        labelText: 'Card Holder Name'),
                    onCreditCardModelChange: _.onCreditCardModelChange,
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  CommonButton(
                      text: 'Submit',
                      onPressed: () async {
                        CommonSnackBar.showSnackBar(
                            title: 'Card Added Successfully', isWarning: false);
                             Get.offAllNamed(AppRoutes.dashboard);
                      }),
                ],
              ).marginSymmetric(horizontal: 20),
            ),
          );
        });
  }

  // ---------------------------------------- Common INPUT DECORATION FOR PAYMENT SCREEN -------------------------------------------------------

  InputDecoration commonInputDecoration(
      {required String hintText, required String labelText}) {
    return InputDecoration(
      // errorText: "This Field is Required",

      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.primaryColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      hintStyle: TextStyle(color: AppColors.blackColor30, fontSize: 12),

      labelText: labelText,

      labelStyle: const TextStyle(
          color: AppColors.blackButtoncolor,
          fontSize: 12.0,
          fontWeight: FontWeight.bold),
      border: const OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xfff7fbff)),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }
}
