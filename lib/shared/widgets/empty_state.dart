import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:strong_pass/shared/constants/app_images.dart';

class EmptyState extends StatelessWidget {
  final String message;

  const EmptyState({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 8, right: 8),
      child: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          SvgPicture.asset(
            isDark ? AppImages.emptyDark : AppImages.emptyLight,
            width: size.width * 0.5,
            height: 160,
          ),
        ],
      ),
    );
  }
}
