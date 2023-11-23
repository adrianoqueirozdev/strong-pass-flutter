import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:strong_pass/shared/constants/storage_keys.dart';

mixin PasswordVisible on GetxController {
  final GetStorage _storage = GetStorage();

  final _passwordVisible = false.obs;

  bool get passwordVisible => _passwordVisible.value;

  void togglePasswordVisibility() {
    _passwordVisible.value = !_passwordVisible.value;

    _storage.write(StorageKeys.isPasswordVisible, _passwordVisible.value);
    update();
  }

  @override
  void onInit() {
    _passwordVisible.value = _storage.read(StorageKeys.isPasswordVisible) ?? false;
    update();
    super.onInit();
  }
}
