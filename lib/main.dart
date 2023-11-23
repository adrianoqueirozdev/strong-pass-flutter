import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:strong_pass/app.dart';
import 'package:strong_pass/shared/constants/environment.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:strong_pass/shared/cubits/visibility_password.dart';

var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  await dotenv.load(fileName: Environment.fileName);

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: Environment.apiKey,
      projectId: Environment.projectId,
      storageBucket: Environment.storageBucket,
      messagingSenderId: Environment.messagingSenderId,
      appId: Environment.appId,
    ),
  );

  if (kReleaseMode) {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  runApp(
    BlocProvider(
      create: (_) => VisibilityPasswordCubit(),
      child: const App(),
    ),
  );
}
