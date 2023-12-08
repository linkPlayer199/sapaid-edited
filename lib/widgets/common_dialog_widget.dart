import 'package:sapaid/constants/app_libraries.dart';

class CommonAlertDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final ImageProvider? image;
  final String? buttonText;
  final VoidCallback onButtonPressed;

  const CommonAlertDialog({
    super.key,
    this.title,
    this.subtitle,
    this.image,
    this.buttonText,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null
          ? Center(
              child: Text(
              title!,
              style: GoogleFonts.roboto(
                  color: AppColors.blackButtoncolor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ))
          : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (subtitle != null)
            Text(
              subtitle!,
              style: GoogleFonts.roboto(
                  color: AppColors.blackButtoncolor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          const SizedBox(
            height: 30,
          ),
          if (image != null)
            Image(
              image: image!,
              height: 200,
            ),
        ],
      ),
      actions: [
        CommonButton(text: buttonText ?? "Ok", onPressed: onButtonPressed)
            .marginSymmetric(vertical: 30, horizontal: 20)
      ],
    );
  }
}

class CommonConfirmationDialog {
  static void showConfirmationDialog({
    final String? image,
    final String? buttonText,
    final VoidCallback? onButtonPressed,
    required String title,
    required String description,
    // required VoidCallback onYesPressed,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.white,
        shadowColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              image!,
              height: 150,
            ), // Display image at the top
            const SizedBox(height: 20),
            Text(title,
                style: GoogleFonts.poppins(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            const SizedBox(height: 20),
            Text(description,
                style: GoogleFonts.poppins(
                    color: AppColors.textColor, fontWeight: FontWeight.w400)),
            const SizedBox(height: 20),
            CommonButton(
                text: buttonText!,
                onPressed: onButtonPressed!,
                color: AppColors.primaryColor),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     CommonButton(
            //         text: 'Cancel',
            //         onPressed: () {
            //           Get.back();
            //         },
            //         color: AppColors.blackButtoncolor),
            //     CommonButton(
            //       text: 'Confirm',
            //       onPressed: onYesPressed,
            //       color: Colors.redAccent,
            //     ).marginSymmetric(vertical: 10),
            //   ],
            // ),
            const SizedBox(height: 10),
          ],
        ).marginAll(15),
      ),
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
