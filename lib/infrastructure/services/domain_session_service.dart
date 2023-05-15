import 'package:firebase_auth/firebase_auth.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_user_factory.dart';
import 'package:txiapp/domain/models/user/user.dart' as domain;
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/services/i_session_service.dart';
import 'package:txiapp/domain/utils/exceptions/session_expired_exception.dart';

class DomainSessionService implements ISessionService{
  final FirebaseAuth _firebaseAuth;
  final IUserFactory _userFactory;
  final IEmailFactory _emailFactory;

  DomainSessionService(this._firebaseAuth, this._userFactory, this._emailFactory);

  @override
  domain.User getCurrentUser() {
    User? user = _firebaseAuth.currentUser;
    if(user == null) throw SessionExpiredException({'session': 'Session Expired'});

    String? email = user.email;
    if(email == null) throw SessionExpiredException({'session': 'Session Expired'});

    return _userFactory.reconstitute(id: UserId(user.uid), email: _emailFactory.reconstitute(email));
  }

}