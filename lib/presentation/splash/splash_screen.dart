import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:strong_pass/presentation/splash/splash_controller.dart';
import 'package:strong_pass/shared/widgets/app_logo.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
          ),
          body: const Center(
            child: AppLogo(
              isAnimated: true,
            ),
          ),
        );
      },
    );
  }
}
