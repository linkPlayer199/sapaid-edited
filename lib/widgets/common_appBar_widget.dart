import 'package:sapaid/constants/app_libraries.dart';

class CommonAppBar extends PreferredSize {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool displayTextField;
  final TextEditingController? controller;
  final String? hintText;
  bool? centertitle;
  final FormFieldValidator<String>? validator;

  CommonAppBar({
    super.key,
    this.centertitle,
    this.title,
    this.actions,
    this.leading,
    this.displayTextField = false,
    this.controller,
    this.hintText,
    this.validator,
  }) : super(
          preferredSize: Size.fromHeight(displayTextField ? 112.0 : 56.0),
          child: AppBar(
            centerTitle: centertitle ?? true,
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.whitecolor,
            elevation: 0.0,
            title: displayTextField
                ? CommonTextField(
                    controller: controller,
                    hintText: hintText,
                    validator: validator,
                  )
                : Text(
                    title ?? '',
                    style: GoogleFonts.poppins(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
            actions: actions,
            leading: leading,
          ),
        );
}
