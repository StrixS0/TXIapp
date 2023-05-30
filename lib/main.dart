// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/presentation/guest/welcome/welcome.dart';
import 'package:txiapp/presentation/main/main_wrapper.dart';

//Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = 'pk_test_51LaAWsG0IrZP1KAROufnYwgB4bbDFZ6XuSTygLqjOiyh18ljRsRAyBJRlLeJvQg8ACLhoRLcMAVTP3I8nEEAZFFX0047h2oWcs';
  await Stripe.instance.applySettings();

  setup();

  getIt<FirebaseAuth>().useAuthEmulator('localhost', 9099);
  getIt<FirebaseFirestore>().useFirestoreEmulator('localhost', 8080);

  runApp(const MainWrapper());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Welcome(),
    );
  }
}
