import 'package:flutter/material.dart';

class CardOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget trailing;

  const CardOption({super.key, required this.icon, required this.title, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 4,
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
    );
  }
}
