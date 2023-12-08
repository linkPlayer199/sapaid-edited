import 'package:sapaid/constants/app_libraries.dart';

class WalletController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();
  TextEditingController topUpAmountController=TextEditingController();
   String cardNumber = '1234 123412341234';
  String cvcCode = '123';
  String cardHolderName = 'Moeez Suleman'.toUpperCase();
  String expiryDate = '11/25';
  bool isCvcFocused = false;

  @override
  void onReady() async {
    // await navigatetohome();
    isLoading = false;
    update();
    super.onReady();
  }
}
