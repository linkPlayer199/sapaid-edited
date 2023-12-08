import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/notifications/notifications_controller.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'Notifications',
        leading: CommonIconButton(
          iconData: Icons.chevron_left,
          color: AppColors.blackButtoncolor,
          isButton: true,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          Image.asset(
            AppAssets.appsecondarylogo,
            fit: BoxFit.contain,
          ).marginAll(12)
        ],
      ),
      body: bodyData(context),
    );
  }

  // ------------------- MAIN WIDGET -----------------------------

  Widget bodyData(BuildContext context) {
    return GetBuilder<NotificationController>(
        init: NotificationController(),
        builder: (_) {
          return _.isLoading
              ? const IsLoading()
              : Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                      // separatorBuilder: (context, index) => SizedBox(
                      //   height: 10,
                      // ),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: index.isEven
                                        ? Colors.greenAccent
                                        : Colors.red),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.transparent,
                                    spreadRadius: 1,
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                                color: const Color(0xfff0f0f0),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: 'You have recieved ',
                                      style: const TextStyle(
                                          color: Colors.black, fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: '\u0024100 ',
                                          style: TextStyle(
                                              color: index.isEven
                                                  ? Colors.greenAccent
                                                  : Colors.red,
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const TextSpan(
                                          text: 'from account ending with',
                                          style: TextStyle(
                                            color: AppColors.blackButtoncolor,
                                            fontSize: 13,
                                            fontFamily: 'Poppins',
                                          ),
                                        ),
                                        const TextSpan(
                                          text: ' 4242',
                                          style: TextStyle(
                                            color: AppColors.primaryColor,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Poppins',
                                          ),
                                        )
                                      ]),
                                ).marginOnly(bottom: 10),
                                RichText(
                                  text: const TextSpan(
                                      text: 'Bank Name ',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 13),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'USA NATIONAL BANK',
                                          style: TextStyle(
                                              color: AppColors.primaryColor,
                                              fontSize: 13,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ]),
                                ).marginOnly(bottom: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color: AppColors.blackButtoncolor,
                                    ).marginOnly(right: 5, left: 20),
                                    const MyText(
                                      text: '2023-11-12',
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.schedule,
                                      color: AppColors.blackButtoncolor,
                                    ).marginOnly(
                                      right: 5,
                                    ),
                                    const MyText(
                                      text: '11:30',
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ).marginOnly(
                                      right: 25,
                                    )
                                  ],
                                ).marginOnly(top: 10)
                              ],
                            )).marginSymmetric(horizontal: 20, vertical: 10);
                      },
                    ))
                  ],
                );
        });
  }
}
