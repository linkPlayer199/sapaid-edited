import 'package:sapaid/constants/app_libraries.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class AddCardController extends GetxController {
  bool isLoading = true;

  String cardNumber = '';

  String expiryDate = '';

  String expiryMonth = '';

  String cardHolderName = '';

  String cvvCode = '';

  bool isCvvFocused = false;

  bool useGlassMorphism = false;

  bool useBackgroundImage = false;

  OutlineInputBorder? border;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final storage = GetStorage();

  String apiMesage = '';

 

  @override
  void onReady() async {
   
    isLoading = false;
    update();
    super.onReady();
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    cardNumber = creditCardModel!.cardNumber;
    expiryDate = creditCardModel.expiryDate;
    cardHolderName = creditCardModel.cardHolderName;
    cvvCode = creditCardModel.cvvCode;
    isCvvFocused = creditCardModel.isCvvFocused;

    update();
  }

 
}
