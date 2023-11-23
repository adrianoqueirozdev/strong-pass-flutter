import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final Widget child;

  const Content({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
