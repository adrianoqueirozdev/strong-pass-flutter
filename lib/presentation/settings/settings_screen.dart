import 'package:flutter/material.dart';
import 'package:strong_pass/presentation/settings/widgets/card_option.dart';
import 'package:strong_pass/shared/widgets/content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
      ),
      body: Content(
        child: ListView(
          children: const [
            CardOption(
              icon: Icons.delete_rounded,
              title: "Lixeira",
              trailing: Text("7"),
            ),
            Divider(
              thickness: 0.6,
            ),
            CardOption(
              icon: Icons.password_rounded,
              title: "Senha mestra",
              trailing: Icon(Icons.chevron_right_rounded),
            ),
            Divider(
              thickness: 0.6,
            ),
            CardOption(
              icon: Icons.backup_rounded,
              title: "Fazer backup",
              trailing: Icon(Icons.chevron_right_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
