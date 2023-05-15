import 'package:txiapp/domain/models/user/user.dart';

abstract class ISessionService{
  User getCurrentUser();
}