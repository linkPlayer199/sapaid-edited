import 'package:flutter/services.dart';
import 'package:sapaid/constants/app_libraries.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? labelText;
  final Color? fillcolor;
  final Color? bordercolor;
  final bool isTextHidden;
  final bool isRequired;
  final String? hintText;
  final IconData? buttonIcon;
  final IconData? prefixIcon;
  final bool? togglePassword;
  final int? maxlines;
  final int? maxlength;
  final int? maxLength;
  final Function()? toggleFunction;
  final IconData? toggleIcon;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Function()? onTap;
  final Function(String?)? onSaved;
  final Function()? prefixIconTap;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focus;
  final TextInputAction? textInputAction;
  final Widget? suffixicon;
  final double? radius;
  final changeObscureStatus;
  const CommonTextField(
      {Key? key,
      @required this.controller,
      this.validator,
      this.radius,
      this.bordercolor,
      this.labelText,
      this.fillcolor,
      this.maxLength,
      this.maxlines,
      this.hintText,
      this.isTextHidden = false,
      this.buttonIcon,
      this.prefixIcon,
      this.onChanged,
      this.togglePassword = false,
      this.toggleFunction,
      this.toggleIcon,
      this.isRequired = true,
      this.keyboardType = TextInputType.text,
      this.textInputAction = TextInputAction.done,
      this.readOnly,
      this.onTap,
      this.inputFormatters,
      this.prefixIconTap,
      this.changeObscureStatus,
      this.onSaved,
      this.focus,
      this.suffixicon,
      this.maxlength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      maxLines: maxlines,
      textAlign: TextAlign.left,
      autovalidateMode:
          isRequired ? AutovalidateMode.always : AutovalidateMode.disabled,
      textAlignVertical: TextAlignVertical.center,
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      obscureText: isTextHidden,
      readOnly: readOnly == null ? false : true,
      onTap: onTap,
      maxLength: maxLength,
      cursorColor: AppColors.primaryColor,
      focusNode: focus,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        // errorText: "This Field is Required",
        suffix: suffixicon,
        prefixIcon: prefixIcon != null
            ? GestureDetector(
                onTap: prefixIconTap,
                child: Icon(
                  prefixIcon,
                  color: AppColors.textfieldicongreyColor,
                  size: 20.0,
                ),
              )
            : null,
        suffixIcon: IconButton(
            onPressed: toggleFunction,
            icon: Icon(
              toggleIcon,
              color: AppColors.primaryColor,
            )),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: bordercolor ?? Colors.black.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 10.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: bordercolor ?? AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 10.0),
          ),
        ),
        hintText: hintText,
        fillColor: fillcolor,
        filled: true,
        hintStyle: TextStyle(color: AppColors.blackColor30, fontSize: 12),

        labelText: labelText,

        labelStyle: const TextStyle(color: Colors.black, fontSize: 10.0),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xfff7fbff)),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.0)),
        ),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 15),
      controller: controller,
      validator: validator,
    );
  }
}
