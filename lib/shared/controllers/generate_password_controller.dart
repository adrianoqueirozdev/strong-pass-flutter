import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:random_password_generator/random_password_generator.dart';

class GeneratePasswordController extends GetxController {
  final _password = ''.obs;

  String get password => _password.value;

  void generatePassword() {
    _password.value = RandomPasswordGenerator().randomPassword(letters: false, numbers: true, passwordLength: 6);
    update();
  }

  void copyPassword() {
    Get.back();
    Clipboard.setData(ClipboardData(text: password));
  }

  @override
  void onInit() {
    generatePassword();
    super.onInit();
  }
}
