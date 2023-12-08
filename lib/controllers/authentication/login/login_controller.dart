import 'package:sapaid/constants/app_libraries.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool passwordshown = true;
  bool isLoading = true;
  final storage = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
