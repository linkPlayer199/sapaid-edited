import 'dart:io';

import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/dashboard/dasboard_controller.dart';
import 'package:sapaid/screens/history/history_screen.dart';
import 'package:sapaid/screens/home/home_screen.dart';
import 'package:sapaid/screens/notification/notification_screen.dart';
import 'package:sapaid/screens/setting/setting_screen.dart';
import 'package:sapaid/screens/wallet/wallet_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            if (_.navigationQueue.isEmpty) {
              return showWillPopMessage(context);
            }
            _.navigationQueue.removeLast();
            int position =
                _.navigationQueue.isEmpty ? 0 : _.navigationQueue.last;
            _.currentindex.value = position;
            _.update();
            return false;
          },
          child: Scaffold(
              backgroundColor: Colors.white,
              body: _.isLoading ? const IsLoading() : getBody(_),
              bottomNavigationBar: bottomnavbar(_)),
        );
      },
    );
  }

  showWillPopMessage(context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          title: const Text(
            'Exit App?',
            textScaleFactor: 1.0,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              letterSpacing: 0.4,
              fontFamily: 'Roboto',
            ),
          ),
          content: SizedBox(
            height: 100.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Are you sure you want to exit App?',
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      letterSpacing: 0.4,
                      fontFamily: 'Roboto'),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      onPressed: () async {
                        Get.back();
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        "CANCEL",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 16),
                      ),
                      minWidth: Get.width / 3.5,
                      height: 48,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9.0),
                        side: const BorderSide(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      onPressed: () async {
                        exit(0);
                      },
                      minWidth: Get.width / 3.4,
                      height: 40,
                      child: const Text(
                        "Exit",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                            fontSize: 16, color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget bottomnavbar(DashboardController _) {
    return SnakeNavigationBar.color(
      snakeViewColor: AppColors.whitecolor,
      shadowColor: AppColors.primaryColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      behaviour: SnakeBarBehaviour.floating,
      padding: const EdgeInsets.all(12),

      // selectedItemPosition : 2,
      snakeShape: SnakeShape.indicator,

      showSelectedLabels: false,
      showUnselectedLabels: false,

      //  selectedColor : Colors.black,
      //  unselectedColor : Colors.blueGrey,

      unselectedLabelStyle:
          GoogleFonts.poppins(color: AppColors.blackButtoncolor),
      backgroundColor: AppColors.primaryColor,
      // unselectedFontSize: 10,
      elevation: 5,
      selectedLabelStyle:
          GoogleFonts.poppins(color: AppColors.blackButtoncolor),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Home",
          activeIcon: Icon(
            FontAwesomeIcons.home,
          ),
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: "History",
          activeIcon: Icon(
            FontAwesomeIcons.history,
          ),
          icon: Icon(
            Icons.history,
          ),
        ),
        BottomNavigationBarItem(
          label: "Find Services",
          activeIcon: Icon(
            FontAwesomeIcons.wallet,
          ),
          icon: Icon(
            Icons.wallet_outlined,
          ),
        ),
        BottomNavigationBarItem(
          label: "Notifications",
          activeIcon: Icon(
            Icons.notifications,
          ),
          icon: Icon(
            Icons.notifications_none,
          ),
        ),
        BottomNavigationBarItem(
          label: "Account",
          activeIcon: Icon(
            Icons.more_vert,
          ),
          icon: Icon(
            Icons.more_vert_outlined,
          ),
        ),
      ],
      currentIndex: _.currentindex.value,
      unselectedItemColor: AppColors.whitecolor,
      // showSelectedLabels: true,
      selectedItemColor: AppColors.whitecolor,
      // selectedFontSize: 13,
      // showUnselectedLabels: false,
      onTap: (index) async {
        _.changeTabIndex(index);
      },
    );
  }

  Widget getBody(DashboardController _) {
    List<Widget> pages = [
      const HomeScreen(),
      const HistoryScreen(),
      const WalletScreen(),
      const NotificationScreen(),
      const SettingScreen()
    ];
    return IndexedStack(
      index: _.currentindex.value,
      children: pages,
    );
  }
}
