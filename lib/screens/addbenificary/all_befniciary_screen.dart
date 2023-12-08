import 'package:flutter/material.dart';
import 'package:sapaid/constants/app_libraries.dart';
import 'package:sapaid/controllers/allbenificiary/all_benificiary_controller.dart';

class AllBenificiaryScreen extends StatelessWidget {
  const AllBenificiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.whitecolor,
        title: const MyText(
          letterSpacing: 1,
          text: 'Transfer',
          fontFamily: 'Poppins',
          color: AppColors.primaryColor,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
        leading: CommonIconButton(
          iconData: Icons.chevron_left,
          isButton: true,
          color: AppColors.blackButtoncolor,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: bodydata(context),
    ));
  }

  // --------------------------------------  MIAN WIDGET ---------------------------------------------------

  Widget bodydata(BuildContext context) {
    return GetBuilder<AllBenificiaryController>(
        init: AllBenificiaryController(),
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Send To',
                fontFamily: 'Poppins',
                color: AppColors.blackButtoncolor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ).marginSymmetric(vertical: 10),
              SizedBox(
                height: 100,
                width: Get.width,
                child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        AppAssets.avatar,
                        color: AppColors.primaryColor,
                      ),
                    );
                  },
                ),
              )
            ],
          );
        });
  }
}
