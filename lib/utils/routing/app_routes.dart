import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/screens/NewScreens/addagent.dart';
import 'package:sapaid/screens/NewScreens/addagenttwo.dart';
import 'package:sapaid/screens/NewScreens/addcard.dart';
import 'package:sapaid/screens/NewScreens/addcardetails.dart';
import 'package:sapaid/screens/NewScreens/banktransfer.dart';
import 'package:sapaid/screens/NewScreens/banktransfertwo.dart';
import 'package:sapaid/screens/NewScreens/login1.dart';
import 'package:sapaid/screens/NewScreens/transfer.dart';
import 'package:sapaid/screens/addbenificary/all_befniciary_screen.dart';
import 'package:sapaid/screens/appinformation/privacy_screen.dart';
import 'package:sapaid/screens/appinformation/terms_screen.dart';
import 'package:sapaid/screens/authentication/forgetpassword/forget_email_screen.dart';
import 'package:sapaid/screens/authentication/forgetpassword/forget_password_screen.dart';
import 'package:sapaid/screens/authentication/forgetpassword/new_password_screen.dart';
import 'package:sapaid/screens/authentication/login/login_screen.dart';
import 'package:sapaid/screens/authentication/register/register_screen.dart';
import 'package:sapaid/screens/authentication/register/verify_otp_screen.dart';
import 'package:sapaid/screens/creditcard/credit_card_screen.dart';
import 'package:sapaid/screens/dashboard/dashBoard_screen.dart';
import 'package:sapaid/screens/onBoarding/onBoarding_screen.dart';
import 'package:sapaid/screens/splash/splash_screen.dart';

class AppPages {
  static var initial = AppRoutes.splash
  ;
  static final routes = [
    // <------ Splash Routes --------->
       GetPage(name: AppRoutes.loginscreennew, page:()=> LoginScreenNew()),
    GetPage(name: AppRoutes.banktransfertwo, page:()=> BankTransferTwo()),
    GetPage(name: AppRoutes.banktransfer, page:()=> BankTransfer()),
    GetPage(name: AppRoutes.addcarddetails, page:()=>  AddcardDetails()),
    GetPage(name: AppRoutes.addagenttwo, page:()=>  AddAgentTwo()),
    GetPage(name: AppRoutes.addagent, page:()=> AddAgent()),
    GetPage(name: AppRoutes.transfer, page:()=> Transfer()),
    GetPage(name: AppRoutes.addCard2, page:()=> Addcard()),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
    ),

    // <------ LOGIN Routes --------->

    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
    ),

    // <------ REGISTER Routes --------->

    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterScreen(),
    ),

    // <------ FORGET PASSWORD Routes --------->

    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => const ForgetPasswordScreen(),
    ),

    // <------ FORGET PASSWORD EMAIL Routes --------->

    GetPage(
      name: AppRoutes.forgetPasswordEmail,
      page: () => const ForgetEmailScreen(),
    ),

    // <------ OTP Routes --------->

    GetPage(
      name: AppRoutes.verifyOTP,
      page: () => const VerifyOTPScreen(),
    ),

    // <------ NEW PASSWORD Routes --------->

    GetPage(
      name: AppRoutes.newPassword,
      page: () => const NewPasswordScreen(),
    ),

    // <------ ADD CARD Routes --------->

    GetPage(
      name: AppRoutes.addCard,
      page: () => const AddCardScreen(),
    ),

    // <------ ONBOARDING Routes --------->

    GetPage(
      name: AppRoutes.onBoard,
      page: () => const OnBoardingScreen(),
    ),

    // <------ DASHBOARD Routes --------->

    GetPage(
      name: AppRoutes.dashboard,
      page: () => const Dashboard(),
    ),

    // <------ TERMS Routes --------->

    GetPage(
      name: AppRoutes.terms,
      page: () => const TermsAndConditionsScreen(),
    ),

    // <------ POLICY Routes --------->

    GetPage(
      name: AppRoutes.privacy,
      page: () => const PrivacyPolicyScreen(),
    ),

     // <------ ALL BENIFICIARY Routes --------->

    GetPage(
      name: AppRoutes.allBenificiary,
      page: () => const AllBenificiaryScreen(),
    ),
  ];
}
