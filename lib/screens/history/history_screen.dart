import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sapaid/constants/app_libraries.dart'; // Make sure this import is correct
import 'package:sapaid/controllers/history/history_controller.dart'; // Make sure this import is correct

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'History',
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

  Widget bodyData(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      builder: (_) {
        return _.isLoading
            ? const IsLoading() // Make sure this widget is defined in your app
            : Column(
                children: [
                  CommonButton(
                    // Make sure this widget is defined in your app
                    text: 'Download E-Statement',
                    onPressed: () {},
                    color: AppColors.whitecolor,
                    textStyle: const TextStyle(
                        color: AppColors.lightgreenColor,
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                    isIconShown: true,
                    icondata: Icons.download,
                    iconcolor: AppColors.lightgreenColor,
                  ).marginOnly(top: 20),
                  Container(
                    width: 100, // Take the full width
                    padding: const EdgeInsets.all(8.0), // Add some padding
                    decoration: BoxDecoration(
                      color: AppColors
                          .whitecolor, // Add a background color if needed
                      border: Border.all(
                        color: AppColors.lightgreyColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MyText(
                          text: 'Today',
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textColor,
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: AppColors.blackButtoncolor,
                        ),
                      ],
                    ),
                  ).marginOnly(top: 10),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: index.isEven
                                    ? Colors.redAccent
                                    : AppColors.lightgreenColor),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          color: AppColors.whitecolor,
                          shadowColor: AppColors.lightgreyColor,
                          margin: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(12),
                            leading: CircleAvatar(
                                backgroundColor: index.isEven
                                    ? Colors.redAccent
                                    : AppColors.lightgreenColor,
                                child: CommonIconButton(
                                    iconData: index.isEven
                                        ? Icons.trending_up_outlined
                                        : Icons.trending_down_outlined,
                                    color: AppColors.whitecolor)),
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const MyText(
                                  text: 'Sender Person Name',
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const MyText(
                                      text: 'Bank Name',
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    MyText(
                                      text: '12000',
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: index.isEven
                                          ? Colors.redAccent
                                          : AppColors.lightgreenColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ).marginOnly(top: 20),
                              ],
                            ),
                            // trailing: CircleAvatar(
                            //   backgroundColor: AppColors.lightgreyColor,
                            // ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
      },
    );
  }
}
