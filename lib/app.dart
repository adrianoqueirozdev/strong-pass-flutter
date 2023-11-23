import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:secure_application/secure_application.dart';
import 'package:strong_pass/app_controller.dart';
import 'package:strong_pass/app_routes.dart';
import 'package:strong_pass/shared/constants/app_routes.dart';
import 'package:strong_pass/shared/constants/app_fonts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (controller) {
        final colorScheme = ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: controller.brightness,
        );

        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          builder: (context, child) {
            return SecureApplication(
              secureApplicationController: controller.secureApplicationController,
              child: SecureGate(
                child: child!,
              ),
            );
          },
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: AppFonts.lexendDeca,
            colorScheme: colorScheme,
            appBarTheme: AppBarTheme(
              scrolledUnderElevation: 0,
              backgroundColor: colorScheme.background,
              foregroundColor: colorScheme.onBackground,
            ),
            bottomSheetTheme: BottomSheetThemeData(
              backgroundColor: colorScheme.background,
              surfaceTintColor: colorScheme.background,
            ),
            snackBarTheme: const SnackBarThemeData(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
            ),
            textTheme: const TextTheme(
              bodySmall: TextStyle(
                fontSize: 14,
              ),
              bodyMedium: TextStyle(
                fontSize: 16,
              ),
              bodyLarge: TextStyle(
                fontSize: 18,
              ),
              titleSmall: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              titleMedium: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              titleLarge: TextStyle(
                fontSize: 24,
              ),
              labelSmall: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              labelMedium: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              labelLarge: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              displaySmall: TextStyle(
                fontSize: 37,
              ),
              headlineSmall: TextStyle(
                fontSize: 25,
              ),
            ),
            pageTransitionsTheme: const PageTransitionsTheme(
              builders: {
                TargetPlatform.android: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                ),
                TargetPlatform.iOS: SharedAxisPageTransitionsBuilder(
                  transitionType: SharedAxisTransitionType.horizontal,
                ),
              },
            ),
          ),
          initialRoute: AppRoutes.splash,
          routes: getRoutes(),
        );
      },
    );
  }
}
