import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:txiapp/domain/factories/i_customer_factory.dart';
import 'package:txiapp/domain/factories/i_profile_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/repositories/i_user_repository.dart';
import 'package:txiapp/firebase_options.dart';
import 'package:txiapp/infrastructure/factories/customer_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/profile_factory_impl.dart';
import 'package:txiapp/infrastructure/repositories/user_repository_impl.dart';
import 'package:txiapp/infrastructure/services/registration_service_impl.dart';
import 'package:txiapp/main.dart';

void setUpGetIt() async{

  // GetIt.I.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  // GetIt.I.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  // Set the emulator settings
  
  

  // register your dependencies here
  

  // GetIt.I.registerSingleton<IUserFactory>(UserFactoryImpl());
  // GetIt.I.registerSingleton<IProfileFactory>(ProfileFactoryImpl());
  // GetIt.I.registerSingleton<ICustomerFactory>(CustomerFactoryImpl());

  // GetIt.I.registerSingleton<IUserRepository>(UserRepositoryImpl(firebaseAuth: FirebaseAuth.instance, userFactory: GetIt.I<IUserFactory>()));

  // GetIt.I.registerSingleton<IRegistrationService>(RegistrationServiceImpl(GetIt.I<IUserFactory>(), GetIt.I<IProfileFactory>(), GetIt.I<ICustomerFactory>(), GetIt.I<IUserRepository>()));
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  // setUp(() => setUpGetIt());


  test('Test my service', () async{
    

    // final service = GetIt.I<IRegistrationService>();
    print('syccess');
    // service.register(type: 'personal', name: 'Test User', email: 'test@mailinator.com', password: 'password', phoneNumber: '123456', yearOfBirth: 1994, address: Address.create('Test Address', '2501', 'California'));

    UserCredential creds = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'test3@mailinator.com', password: 'password');
    
    expect(creds.user, isEmpty);
  });
}