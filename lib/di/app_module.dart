import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:txiapp/domain/factories/i_customer_factory.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/factories/i_team_member_factory.dart';
import 'package:txiapp/domain/factories/i_user_factory.dart';
import 'package:txiapp/domain/repositories/i_customer_repository.dart';
import 'package:txiapp/domain/repositories/i_payment_details_repository.dart';
import 'package:txiapp/domain/repositories/i_team_member_repository.dart';
import 'package:txiapp/domain/repositories/i_user_repository.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/domain/services/i_notification_service.dart';
import 'package:txiapp/domain/services/i_payment_service.dart';
import 'package:txiapp/domain/services/i_registration_service.dart';
import 'package:txiapp/domain/services/i_team_member_service.dart';
import 'package:txiapp/domain/usecases/common/activate_customer_usecase/activate_customer_usecase.dart';
import 'package:txiapp/domain/usecases/common/add_payment_method_usecase/add_payment_method_usecase.dart';
import 'package:txiapp/domain/usecases/common/forgot_password_usecase/forgot_password_usecase.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_usecase.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_usecase.dart';
import 'package:txiapp/domain/usecases/customer/add_team_member/add_team_member_usecase.dart';
import 'package:txiapp/infrastructure/factories/customer_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/email_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/phone_number_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/team_member_factory_impl.dart';
import 'package:txiapp/infrastructure/factories/user_factory_impl.dart';
import 'package:txiapp/infrastructure/repositories/customer_repository_impl.dart';
import 'package:txiapp/infrastructure/repositories/payment_details_repository_impl.dart';
import 'package:txiapp/infrastructure/repositories/team_member_repository_impl.dart';
import 'package:txiapp/infrastructure/repositories/user_repository_impl.dart';
import 'package:txiapp/infrastructure/services/customer_service_impl.dart';
import 'package:txiapp/infrastructure/services/notification_service_impl.dart';
import 'package:txiapp/infrastructure/services/registration_service_impl.dart';
import 'package:txiapp/infrastructure/services/stripe_card_service.dart';
import 'package:txiapp/infrastructure/services/team_member_service_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);

  getIt.registerSingleton<IUserFactory>(UserFactoryImpl());
  getIt.registerSingleton<IEmailFactory>(EmailFactoryImpl());
  getIt.registerSingleton<ICustomerFactory>(CustomerFactoryImpl());
  getIt.registerSingleton<IPhoneNumberFactory>(PhoneNumberFactoryImpl());
  getIt.registerSingleton<ITeamMemberFactory>(TeamMemberFactoryImpl());

  getIt.registerSingleton<IUserRepository>(UserRepositoryImpl(getIt<FirebaseAuth>(), getIt<IUserFactory>(), getIt<IEmailFactory>()));
  getIt.registerSingleton<ICustomerRepository>(CustomerRepository(getIt<FirebaseFirestore>(), getIt<ICustomerFactory>(), getIt<IEmailFactory>(), getIt<IPhoneNumberFactory>()));
  getIt.registerSingleton<IPaymentDetailsRepository>(PaymentDetailsRepositoryImpl());
  getIt.registerSingleton<ITeamMemberRepository>(TeamMemberRepositoryImpl(getIt<ITeamMemberFactory>()));

  getIt.registerSingleton<IRegistrationService>(RegistrationServiceImpl(getIt<IUserRepository>(), getIt<ICustomerFactory>(), getIt<ICustomerRepository>()));
  getIt.registerSingleton<ICustomerService>(CustomerServiceImpl(getIt<ICustomerRepository>(), getIt<IPaymentDetailsRepository>()));
  getIt.registerSingleton<IPaymentService>(StripeCardService(getIt<IPaymentDetailsRepository>()));
  getIt.registerSingleton<INotificationService>(NotificationServiceImpl());
  getIt.registerSingleton<ITeamMemberService>(TeamMemberServiceImpl(getIt<ITeamMemberFactory>(), getIt<ITeamMemberRepository>()));

  getIt.registerSingleton<SignupUsecase>(SignupUsecase(getIt<IEmailFactory>(), getIt<IPhoneNumberFactory>(), getIt<IUserRepository>()));
  getIt.registerSingleton<RegistrationUsecase>(RegistrationUsecase(getIt<IRegistrationService>(), getIt<IUserFactory>()));
  getIt.registerSingleton<AddPaymentMethodUsecase>(AddPaymentMethodUsecase(getIt<IPaymentService>()));
  getIt.registerSingleton<ActivateCustomerUsecase>(ActivateCustomerUsecase(getIt<ICustomerService>()));
  getIt.registerSingleton<ForgotPasswordUsecase>(ForgotPasswordUsecase(getIt<INotificationService>(), getIt<IEmailFactory>()));
  getIt.registerSingleton<AddTeamMemberUsecase>(AddTeamMemberUsecase(getIt<IEmailFactory>(), getIt<IPhoneNumberFactory>(), getIt<ITeamMemberService>()));

  
}