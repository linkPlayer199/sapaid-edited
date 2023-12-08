
import 'package:sapaid/constants/app_libraries.dart';

class IsCircularLoading extends StatelessWidget {
  const IsCircularLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitDoubleBounce(
      color: AppColors.primaryColor,
    ));
  }
}

class IsLoading extends StatelessWidget {
  const IsLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SpinKitFadingCircle(
      color: AppColors.primaryColor,
    ));
  }
}

class NoData extends StatelessWidget {
  const NoData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorFiltered(
          colorFilter: const ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.modulate,
          ),
          child: Lottie.asset(
            'assets/animations/nodata.json',
          ),
        ),
        const MyText(
          text: "No Record Found",
          fontFamily: "Poppins",
          color: AppColors.blackButtoncolor,
          fontSize: 28,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
