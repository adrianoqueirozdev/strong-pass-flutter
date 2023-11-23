import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final Color? passColor;
  final Color? forteColor;
  final bool isAnimated;

  const AppLogo({super.key, this.passColor, this.forteColor, this.isAnimated = false});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    Widget contentTop() {
      return Padding(
        padding: const EdgeInsets.only(left: 4),
        child: RichText(
          text: TextSpan(
            text: "Pass ",
            style: textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: passColor ?? colorScheme.onBackground,
            ),
            children: [
              TextSpan(
                children: [
                  TextSpan(
                    text: "Forte",
                    style: textTheme.displaySmall?.copyWith(
                      color: forteColor ?? colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget contentBottom() {
      return Container(
        height: 4,
        width: 28,
        decoration: BoxDecoration(
          color: passColor ?? colorScheme.onBackground,
          borderRadius: BorderRadius.circular(2),
        ),
      );
    }

    return Stack(
      children: [
        isAnimated ? SlideInRight(child: contentTop()) : contentTop(),
        Positioned(
          bottom: 0,
          child: isAnimated ? SlideInLeft(child: contentBottom()) : contentBottom(),
        )
      ],
    );
  }
}
