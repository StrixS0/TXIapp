import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/domain/usecases/common/calculate_price_usecase/calculate_price_usecase.dart';
import 'package:txiapp/domain/usecases/common/create_booking/create_booking_usecase.dart';
import 'package:txiapp/domain/usecases/customer/add_team_member/add_team_member_usecase.dart';
import 'package:txiapp/domain/usecases/customer/get_team_members/get_team_member_usecase.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/auth/booking/book_trip/book_trip_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/day_time/day_time_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/passenger/passenger_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/pickup_dropoff/pickup_dropoff_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/select_airport/select_airport_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/select_private_airport/select_private_airport_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/select_team_member/select_team_member_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/select_vehicle/select_vehicle_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/trip_confirmation/trip_confirmation_wrapper.dart';
import 'package:txiapp/presentation/auth/booking/trip_confirmation_review/trip_confirmation_review_wrapper.dart';
import 'package:txiapp/presentation/auth/menu/menu_wrapper.dart';
import 'package:txiapp/presentation/guest/welcome/welcome.dart';
import 'package:txiapp/presentation/guest/login/login_wrapper.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/login_forgot_password_wrapper.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/registration/signup_account_type/signup_account_type.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_confirmation/signup_confirmation_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_personal/signup_personal_wrapper.dart';
import 'package:txiapp/presentation/team_member/add/team_member_add_wrapper.dart';
import 'package:txiapp/presentation/team_member/list/team_member_list.dart';
import 'package:txiapp/presentation/team_member/list/team_member_list_wrapper.dart';
import 'package:txiapp/presentation/team_member/team_member_view_model.dart';
import 'package:txiapp/presentation/utils/screen.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      ChangeNotifierProvider<MainViewmodel>(create: (_) => MainViewmodel(getIt<ICustomerService>())),
      ListenableProxyProvider<MainViewmodel, BookingViewmodel>(update: (context, mainViewmodel, bookingViewmodel) => BookingViewmodel(mainViewmodel, getIt<IBookingService>(), getIt<CreateBookingUsecase>(), getIt<CalculatePriceUsecase>(), getIt<GetTeamMemberUsecase>())),
      ListenableProxyProvider<MainViewmodel, TeamMemberViewModel>(update: (context, mainViewmodel, bookingViewmodel) => TeamMemberViewModel(mainViewmodel, getIt<AddTeamMemberUsecase>(), getIt<GetTeamMemberUsecase>())),
    ],
    child: Consumer<MainViewmodel>(
          builder: (context, viewmodel, child) {

            return MaterialApp(
              navigatorKey: navigatorKey,
              navigatorObservers: [routeObserver],
              initialRoute: '/',
              routes: {
                Screen.welcomeScreen.value: (context) => const Welcome(),
                Screen.loginScreen.value: (context) => const LoginWrapper(),
                Screen.forgotPassword.value:(context) => const LoginForgotPasswordWrapper(),

                Screen.addPaymentMethodScreen.value:(context) => const SignupAddPaymentMethodWrapper(),

                Screen.registrationType.value:(context) => const SignupAccountTypePage(),
                Screen.register.value:(context) => const SignupPersonalWrapper(),
                Screen.createPassword.value:(context) => const SignupConfirmPasswordWrapper(),
                Screen.confirmAccount.value:(context) => const SignupConfirmationWrapper(),

                Screen.home.value:(context) => const MenuWrapper(),

                Screen.selectTeamMember.value:(context) => const SelectTeamMemberWrapper(),
                Screen.bookingTypeMenu.value:(context) => const BookTripWrapper(),
                Screen.selectVehicle.value:(context) => const SelectVehicleWrapper(),
                Screen.selectPassengerCount.value:(context) => const PassengerWrapper(),
                Screen.selectTimeAndDate.value:(context) => const DayTimeWrapper(),
                Screen.selectAirport.value:(context) => const SelectAirportWrapper(),
                Screen.selectPrivateAirport.value:(context) => const SelectPrivateAirportWrapper(),
                Screen.address.value:(context) => const PickupDropoffWrapper(),
                Screen.reviewBooking.value:(context) => const TripConfirmationReviewWrapper(),
                Screen.confirmation.value:(context) => const TripConfirmationWrapper(),
                Screen.teamMemberAdd.value:(context) => const TeamMemberAddWrapper(),
                Screen.teamMemberList.value:(context) => const TeamMemberListWrapper()
              },
            );
          },
        ),
  );
  }
}
