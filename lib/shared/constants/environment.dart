import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName => kReleaseMode ? '.env.production' : '.env.development';
  static String get secreteKey => dotenv.env['SECRET_KEY']!;

  // Firebase
  static String get apiKey => dotenv.env['FIREBASE_API_KEY']!;
  static String get projectId => dotenv.env['FIREBASE_PROJECT_ID']!;
  static String get storageBucket => dotenv.env['FIREBASE_STORAGE_BUCKET']!;
  static String get messagingSenderId => dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!;
  static String get appId => dotenv.env['FIREBASE_APP_ID']!;
}
