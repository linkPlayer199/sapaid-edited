import 'package:sapaid/constants/app_libraries.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'dart:math' as math;

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Widget content;

  const CustomExpansionTile({
    super.key,
    this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionWidget(
      initiallyExpanded: true,
      titleBuilder:
          (double animationValue, _, bool isExpanded, toggleFunction) {
        return InkWell(
            onTap: () => toggleFunction(animated: true),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  color: !isExpanded
                      ? const Color(0xffF6F6F6)
                      : AppColors.primaryColor,
                  elevation: 10,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    selected: true,
                    selectedTileColor: !isExpanded
                        ? const Color(0xffF6F6F6)
                        : AppColors.primaryColor,
                    trailing: Transform.rotate(
                      angle: math.pi * animationValue / 2,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_right,
                        size: 30,
                        color: !isExpanded
                            ? AppColors.blackButtoncolor
                            : AppColors.whitecolor,
                      ),
                    ),
                    title: MyText(
                      text: title,
                      fontFamily: "Roboto",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: !isExpanded
                          ? AppColors.blackButtoncolor
                          : AppColors.whitecolor,
                    ),
                    leading: Icon(icon,
                        color: !isExpanded
                            ? AppColors.blackButtoncolor
                            : AppColors.whitecolor),
                  ),
                )));
      },
      content: content,
    );
  }
}
