import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/user/user.dart';
import 'package:txiapp/domain/models/user/value_objects/password.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

abstract class IUserFactory{
  User create({required Email email, required Password password});
  User reconstitute({required UserId id, required Email email});
}