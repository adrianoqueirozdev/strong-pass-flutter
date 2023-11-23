import 'package:get/get.dart';
import 'package:strong_pass/shared/constants/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.signIn);
    });
    super.onInit();
  }
}
