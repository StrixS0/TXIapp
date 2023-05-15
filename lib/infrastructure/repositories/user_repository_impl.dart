import 'package:firebase_auth/firebase_auth.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_user_factory.dart';
import 'package:txiapp/domain/models/user/user.dart' as domain_user;
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/repositories/i_user_repository.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class UserRepositoryImpl implements IUserRepository{
  final FirebaseAuth _firebaseAuth;
  final IUserFactory _userFactory;
  final IEmailFactory _emailFactory;

  UserRepositoryImpl(this._firebaseAuth, this._userFactory, this._emailFactory);

  @override
  Future<domain_user.User> save(domain_user.User user) async{
    if(user.id() == null){
      String? password = user.password()?.value();
      if(password == null) throw DomainException({'password': 'Password is required.'});
      try{
        UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: user.email().value(), password: password);
        String? uid = userCredential.user?.uid;
        String? email = userCredential.user?.email;

        if(uid == null || email == null) throw DomainException({"user": "Cannot create user account"});

        return _userFactory.reconstitute(id: UserId(uid), email: _emailFactory.reconstitute(email));
      }on FirebaseAuthException catch(e){
        switch(e.code){
          case 'email-already-in-use':
            throw DomainException({'email': 'Email address is already taken.'});

          case 'invalid-email':
            throw DomainException({'email': 'Email address is invalid.'});

          case 'weak-password':
            throw DomainException({'password': 'Password is weak.'});
        }
      }
    }

    throw UnimplementedError("User update is not yet implemented");
  }
  
  @override
  void delete(domain_user.User user) {
    // TODO: implement delete
  }

  @override
  Future<bool> isEmailTaken(String email) async{
    List<String> result = await _firebaseAuth.fetchSignInMethodsForEmail(email);

    return result.isNotEmpty;
  }

}