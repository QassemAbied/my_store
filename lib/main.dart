import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:my_store/core/services/shared_pref.dart';
import 'core/utils/constants.dart';
import 'core/utils/open_boxes_hive.dart';
import 'firebase_options.dart';
import 'injection_container.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await OpenBoxesHive.hiveRegister();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await init();
  await dotenv.load(fileName: ".env");
  Stripe.publishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;
  await Stripe.instance.applySettings();
  await SharedPrefHelper.init();
  if (kDebugMode) {
    print(AppConstants.token);
  }

  runApp(const MyApp());
}
