import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_application/secure_application.dart';

class AppController extends GetxController with WidgetsBindingObserver {
  late SecureApplicationController secureApplicationController;

  final _brightness = Brightness.light.obs;

  Brightness get brightness => _brightness.value;

  void _setBrightness() {
    _brightness.value = WidgetsBinding.instance.platformDispatcher.platformBrightness;
    update();
  }

  @override
  void didChangePlatformBrightness() {
    _setBrightness();

    super.didChangePlatformBrightness();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (Get.isDialogOpen!) Get.back();

    if (state == AppLifecycleState.resumed) {
      secureApplicationController.unlock();
    }

    super.didChangeAppLifecycleState(state);
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addObserver(this);

    _setBrightness();
    secureApplicationController = SecureApplicationController(SecureApplicationState());

    Future.delayed(Duration.zero, () {
      secureApplicationController.secure();
    });

    super.onInit();
  }
}
