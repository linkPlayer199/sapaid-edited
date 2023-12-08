import 'package:sapaid/constants/app_libraries.dart';

class NewPasswordController extends GetxController {
  final formKey = GlobalKey<FormState>();
  bool passwordshown = true;
  bool passwordshown1 = true;
  bool isLoading = true;
  final storage = GetStorage();
  TextEditingController confirmPasswordController = TextEditingController();
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
