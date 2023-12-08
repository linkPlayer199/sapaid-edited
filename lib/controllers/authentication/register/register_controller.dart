import 'package:sapaid/constants/app_libraries.dart';

class RegisterController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool passwordshown = true;
  bool termsandPolicy=false;
  bool isLoading = true;
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  @override
  void onReady() {
    isLoading = false;
    update();
    super.onReady();
  }

  bool validateAndSaveUser() {
    final form = formKey.currentState;
    form?.save();
    if (form!.validate()) {
      return true;
    } else {
      return false;
    }
  }
}
