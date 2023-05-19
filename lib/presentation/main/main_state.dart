import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/presentation/utils/destination.dart';

class MainState{
  bool loggedIn = false;
  Customer? currentCustomer;
  UserId? currentUserId;
  
  Destination? navigate;
}