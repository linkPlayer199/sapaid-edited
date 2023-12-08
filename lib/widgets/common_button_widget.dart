import 'package:sapaid/constants/app_libraries.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final void Function() onPressed;
  final Color? color;
   final Color? iconcolor;
  final double? width;
  final double? height;
  final bool isIconShown;
  final IconData? icondata;

  // ignore: use_key_in_widget_constructors
  const CommonButton(
      {required this.text,
      this.textStyle,
      required this.onPressed,
      this.isIconShown = false,
      this.icondata,
      this.color,
      this.width,
      this.iconcolor,
      this.height});

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
      onPressed: onPressed,
      shape: BoxShape.rectangle,
      duration: 100,
      width: width ?? 250,
      height: height ?? 50,
      color: color ?? AppColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textScaleFactor: 1.0,
            style: textStyle ??
                GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.w600),
            maxLines: 2,
          ),
          const SizedBox(
            width: 5,
          ),
          isIconShown == true
              ? Icon(
                  icondata,
                  color:iconcolor?? Colors.white,
                  size: 20,
                )
              : const SizedBox()
        ],
      ),
    );
  }
}

// ---------------------------------------- Icon Button ----------------------------------------------------

class CommonIconButton extends StatelessWidget {
  final IconData iconData;
  final Color? color;
  final double? size;
  final TextDirection? textDirection;
  final String? semanticLabel;
  final bool? isButton;
  final VoidCallback? onPressed;

  const CommonIconButton({
    super.key,
    required this.iconData,
    this.color,
    this.size,
    this.textDirection,
    this.semanticLabel,
    this.isButton = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return isButton!
        ? IconButton(
            padding: const EdgeInsets.all(0),
            icon: Icon(
              iconData,
              color: color,
              size: size,
              textDirection: textDirection,
              semanticLabel: semanticLabel,
            ),
            onPressed: onPressed,
          )
        : Icon(
            iconData,
            color: color,
            size: size,
            textDirection: textDirection,
            semanticLabel: semanticLabel,
          );
  }
}
