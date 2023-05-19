import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/presentation/main/events/main_event.dart';

class UserLoggedIn implements MainEvent{
  final UserId _userId;

  UserLoggedIn(this._userId);
  
  @override
  UserId data() {
    return _userId;
  }
}