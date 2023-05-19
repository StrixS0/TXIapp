import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:txiapp/domain/factories/i_customer_factory.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/factories/i_user_factory.dart';
import 'package:txiapp/domain/repositories/i_customer_repository.dart';
import 'package:txiapp/domain/repositories/i_payment_details_repository.dart';
import 'package:txiapp/domain/repositories/i_user_repository.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/domain/services/i_payment_service.dart';
import 'package:txiapp/domain/services/i_registration_service.dart';
import 'package:txiapp/domain/usecases/common/activate_customer_usecase/activate_customer_usecase.dart';
import 'package:txiapp/domain/usecases/common/add_payment_method_usecase/add_payment_method_usecase.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_usecase.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_usecase.dart';
import 'package:txiapp/infrastructure/factories/customer_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/email_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/phone_number_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/user_factory_impl.dart';
import 'package:txiapp/infrastructure/repositories/customer_repository_impl.dart';
import 'package:txiapp/infrastructure/repositories/payment_details_repository_impl.dart';
import 'package:txiapp/infrastructure/repositories/user_repository_impl.dart';
import 'package:txiapp/infrastructure/services/customer_service_impl.dart';
import 'package:txiapp/infrastructure/services/registration_service_impl.dart';
import 'package:txiapp/infrastructure/services/stripe_card_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerSingleton<IUserFactory>(UserFactoryImpl());
  getIt.registerSingleton<IEmailFactory>(EmailFactoryImpl(getIt<FirebaseAuth>()));
  getIt.registerSingleton<ICustomerFactory>(CustomerFactoryImpl());
  getIt.registerSingleton<IPhoneNumberFactory>(PhoneNumberFactoryImpl());

  getIt.registerSingleton<IUserRepository>(UserRepositoryImpl(getIt<FirebaseAuth>(), getIt<IUserFactory>(), getIt<IEmailFactory>()));
  getIt.registerSingleton<ICustomerRepository>(CustomerRepository(getIt<FirebaseFirestore>(), getIt<ICustomerFactory>(), getIt<IEmailFactory>(), getIt<IPhoneNumberFactory>()));
  getIt.registerSingleton<IPaymentDetailsRepository>(PaymentDetailsRepositoryImpl());

  getIt.registerSingleton<IRegistrationService>(RegistrationServiceImpl(getIt<IUserRepository>(), getIt<ICustomerFactory>(), getIt<ICustomerRepository>()));
  getIt.registerSingleton<ICustomerService>(CustomerServiceImpl(getIt<ICustomerRepository>(), getIt<IPaymentDetailsRepository>()));
  getIt.registerSingleton<IPaymentService>(StripeCardService(getIt<IPaymentDetailsRepository>()));

  getIt.registerSingleton<SignupUsecase>(SignupUsecase(getIt<IEmailFactory>(), getIt<IPhoneNumberFactory>()));
  getIt.registerSingleton<RegistrationUsecase>(RegistrationUsecase(getIt<IRegistrationService>(), getIt<IUserFactory>()));
  getIt.registerSingleton<AddPaymentMethodUsecase>(AddPaymentMethodUsecase(getIt<IPaymentService>()));
  getIt.registerSingleton<ActivateCustomerUsecase>(ActivateCustomerUsecase(getIt<ICustomerService>()));

  
}