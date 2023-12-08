import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/utils/dependency_injection/dependency_injection.dart';

class NoGlowBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DependencyInjection.dependencies();
    return GetMaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: child!,
        );
      },
      title: AppStrings.appName,
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
      ),
      defaultTransition: Get.defaultTransition,
      supportedLocales: const [Locale("en", "US")],
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
