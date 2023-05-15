import 'package:txiapp/domain/factories/i_user_factory.dart';
import 'package:txiapp/domain/models/user/value_objects/password.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/models/user/user.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';

class UserFactoryImpl extends IUserFactory{
  @override
  User create({required Email email, required Password password}) {
    return User(email: email, password: password);
  }

  @override
  User reconstitute({required UserId id, required Email email}) {
    return User(id: id, email: email);
  }

}