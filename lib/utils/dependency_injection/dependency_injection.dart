import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/screens/internet/internet_controller.dart';

class DependencyInjection {
  static void dependencies() {
    Get.put(InternetController(), permanent: true);
  }
}
