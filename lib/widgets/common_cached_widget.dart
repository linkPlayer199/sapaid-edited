import 'package:sapaid/constants/app_libraries.dart';

class CommonCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;

  const CommonCachedImage({
    Key? key,
    required this.imageUrl,
    this.height = 100.0,
    this.width = 120.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.fill,
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          const IsCircularLoading(),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColors.primaryColor,
      ),
    ).marginAll(5);
  }
}
