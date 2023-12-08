import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/setting/setting_controller.dart';
import 'package:sapaid/widgets/common_setting_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Account",
      ),
      body: bodyData(context),
    );
  }

  Widget bodyData(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (_) {
          return _.isLoading
              ? const IsLoading()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      // --------------------------------- Profile Header -------------------------------------

                      Stack(
                        alignment: Alignment
                            .bottomRight, // Position the edit icon at the bottom right of the avatar
                        children: [
                          CircleAvatar(
                            radius: 50, // Adjust the size of the avatar
                            backgroundImage: AssetImage(
                              AppAssets.avatar,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(2), // White border width
                            decoration: BoxDecoration(
                              color: Colors.white, // White border color
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              backgroundColor:
                                  Colors.blue, // Edit button background color
                              radius: 15, // Size of the edit button
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  size: 15, // Size of the edit icon
                                  color: Colors.white, // Edit icon color
                                ),
                                padding: EdgeInsets
                                    .zero, // Removes any default padding around the IconButton
                                constraints:
                                    BoxConstraints(), // Removes any default constraints
                                onPressed: () {},
                              ),
                            ),
                          ),
                        ],
                      ),

                      ListTile(
                        trailing: const Icon(
                          Icons.copy_all,
                          color: AppColors.primaryColor,
                        ),
                        tileColor: AppColors.whitecolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const MyText(
                          text: 'UserName',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        subtitle: const MyText(
                          text: '@jordan',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        onTap: () {},
                      ).marginSymmetric(vertical: 20),

                      ListTile(
                        trailing: const Icon(
                          Icons.copy_all,
                          color: AppColors.primaryColor,
                        ),
                        tileColor: AppColors.whitecolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const MyText(
                          text: 'Account Number',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        subtitle: const MyText(
                          text: '2120252552',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                        onTap: () {},
                      ),

                      // ----------------------------------- Profile Menu ------------------------------
                      CustomExpansionTile(
                        title: 'My Profile',
                        icon: Icons.person,
                        content: Container(
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              createTile(
                                  title: 'View Profile',
                                  menuIcon: AppAssets.viewprofile,
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.viewProfile);
                                  }),
                              createTile(
                                  title: 'Personal Details',
                                  menuIcon: AppAssets.personaldetails,
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.editProfile);
                                  }),
                            ],
                          ).marginOnly(left: 10),
                        ),
                      ),

                      // ----------------------------------- Service History Menu ------------------------------
                      CustomExpansionTile(
                        title: ' History',
                        icon: Icons.restore,
                        content: Container(
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              createTile(
                                  title: 'Transaction History',
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.serviceHistory);
                                  },
                                  menuIcon: AppAssets.servicehistorymain),
                            ],
                          ).marginOnly(left: 10),
                        ),
                      ),

                      // ----------------------------------- Setting Menu ------------------------------
                      CustomExpansionTile(
                        title: 'Setting',
                        icon: Icons.settings,
                        content: Container(
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              createTile(
                                  title: 'Notifications',
                                  menuIcon: AppAssets.notifications),
                              createTile(
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.membershipScreen);
                                  },
                                  title: 'Connected Cards',
                                  menuIcon: AppAssets.credit_card),
                              createTile(
                                  onPressed: () {
                                    Get.offAllNamed(AppRoutes.addCard);
                                  },
                                  title: 'Add New Card',
                                  menuIcon: AppAssets.credit_card)
                            ],
                          ).marginOnly(left: 10),
                        ),
                      ),

                      // ----------------------------------- Promotional Menu ------------------------------
                      CustomExpansionTile(
                        title: 'Promotional',
                        icon: Icons.add_alert_outlined,
                        content: Container(
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              createTile(
                                  title: 'Invite Friends',
                                  menuIcon: AppAssets.invitefriends),
                              createTile(
                                  title: 'Promote Yoursef',
                                  menuIcon: AppAssets.promoteyourself)
                            ],
                          ).marginOnly(left: 10),
                        ),
                      ),

                      // ----------------------------------- Help Menu ------------------------------
                      CustomExpansionTile(
                        title: 'Help',
                        icon: Icons.help,
                        content: Container(
                          width: double.infinity,
                          color: Colors.grey.shade100,
                          child: Column(
                            children: [
                              createTile(
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.aboutUs);
                                  },
                                  title: 'About Us',
                                  menuIcon: AppAssets.aboutus),
                              createTile(
                                  title: 'Contact Us',
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.contactus);
                                  },
                                  menuIcon: AppAssets.contactus),
                              createTile(
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.privacyPolicy);
                                  },
                                  title: 'Privacy Policy',
                                  menuIcon: AppAssets.privacypolicy),
                              createTile(
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.termsandConditions);
                                  },
                                  title: 'Terms & Conditions',
                                  menuIcon: AppAssets.termsandconditions),
                              createTile(
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.faqs);
                                  },
                                  title: 'FAQS',
                                  menuIcon: AppAssets.faqs),
                              createTile(
                                  onPressed: () {
                                    // Get.toNamed(AppRoutes.onBoard);
                                  },
                                  title: 'OnBoard Tutorial',
                                  menuIcon: AppAssets.onboard)
                            ],
                          ).marginOnly(left: 10),
                        ),
                      ),

                      // ----------------------------------- Deregister Menu ------------------------------

                      ListTile(
                        leading: const Icon(Icons.delete),
                        iconColor: Colors.white,
                        tileColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const MyText(
                          text: 'Delete Account',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        onTap: () {
                          // ConfirmationDialog.showConfirmationDialog(
                          //     title: 'ATTENTIONS',
                          //     description:
                          //         'Attention: All of you services such as current booking & history records will be deleted, make sure you have complted all of you service before closing down your account.'
                          //             .toUpperCase(),
                          //     onYesPressed: () {
                          //       // Get.offAndToNamed(AppRoutes.allAdvert);
                          //     });
                        },
                      ).marginSymmetric(vertical: 20),

                      // ----------------------------------- Logout Menu ------------------------------
                      ListTile(
                        leading: const Icon(Icons.logout),
                        iconColor: Colors.white,
                        tileColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        title: const MyText(
                          text: 'Logout',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        onTap: () {
                          // ConfirmationDialog.showConfirmationDialog(
                          //     title: 'Warning'.toUpperCase(),
                          //     description: 'Are you sure you want to Logout?'
                          //         .toUpperCase(),
                          //     onYesPressed: () {
                          //       Get.offAllNamed(AppRoutes.login);
                          //     });
                        },
                      ).marginSymmetric(vertical: 20),
                    ],
                  ).marginOnly(top: 20, left: 20, right: 20),
                );
        });
  }

  // ------------------------------------------- Inner Menu Tile ---------------------------------

  Widget createTile(
      {String? title, required String menuIcon, VoidCallback? onPressed}) {
    return ListTile(
      onTap: onPressed,
      leading: SizedBox(
        height: 30,
        width: 30,
        child: Center(
            child: Image.asset(
          menuIcon,
          color: AppColors.primaryColor,
        )),
      ),
      title: MyText(
        text: title!,
        fontFamily: "Poppins",
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.blackButtoncolor,
      ),
    );
  }
}
