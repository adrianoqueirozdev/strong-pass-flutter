import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ClipBoardController extends GetxController {
  final _icon = Icons.copy.obs;

  IconData get icon => _icon.value;

  void copy(String text) {
    _icon.value = Icons.check;
    update();
    Clipboard.setData(ClipboardData(text: text));

    Future.delayed(const Duration(seconds: 3), () {
      _icon.value = Icons.copy;
      update();
    });
  }
}
