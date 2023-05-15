import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/user/value_objects/password.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

class User{
  final UserId? _id;
  final Email _email;
  final Password? _password;

  User({UserId? id, required Email email, Password? password})
  : _id = id,
    _email = email,
    _password = password;

  UserId? id(){
    return _id;
  }

  Email email(){
    return _email;
  }

  Password? password(){
    return _password;
  }
}