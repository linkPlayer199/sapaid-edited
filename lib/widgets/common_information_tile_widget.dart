import 'package:sapaid/constants/app_libraries.dart';

class CommonInformationTile extends StatelessWidget {
  final String? title;
  final String? description;
  final Color? titleColor;
  final Color? descriptionColor;
  const CommonInformationTile(
      {Key? key,
       this.title,
       this.description,
      this.titleColor = AppColors.blackButtoncolor,
      this.descriptionColor = AppColors.blackButtoncolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: GoogleFonts.roboto(
              fontSize: 12, fontWeight: FontWeight.w700, color: titleColor),
        ),
        Text(
          description!,
          maxLines: 100,
          style: GoogleFonts.poppins(
              // overflow: TextOverflow.ellipsis,
              fontSize: 13,

              fontWeight: FontWeight.w400,
              color: descriptionColor),
        )
      ],
    );
  }
}
