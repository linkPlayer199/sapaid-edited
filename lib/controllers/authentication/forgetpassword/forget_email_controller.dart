import 'package:sapaid/constants/app_libraries.dart';

class ForgetEmailController extends GetxController {
  bool isLoading = true;
  final storage = GetStorage();
  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

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
