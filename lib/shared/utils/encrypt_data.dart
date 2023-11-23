import 'package:encrypt/encrypt.dart';
import 'package:strong_pass/shared/constants/environment.dart';

class EncryptData {
  static String encryptAES(String data) {
    final key = Key.fromUtf8(Environment.secreteKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(data, iv: iv);
    return encrypted.base64;
  }

  static String decryptAES(String data) {
    final key = Key.fromUtf8(Environment.secreteKey);
    final iv = IV.fromLength(16);
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt64(data, iv: iv);
    return decrypted;
  }
}
