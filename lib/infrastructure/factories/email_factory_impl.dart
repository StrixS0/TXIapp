import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class EmailFactoryImpl extends IEmailFactory{
  final FirebaseAuth _firebaseAuth;

  EmailFactoryImpl(this._firebaseAuth);

  @override
  Future<Email> create(String value) async{
    if(!EmailValidator.validate(value)) throw DomainException({'email': 'Invalid Email address.'});
    if(await _isEmailTaken(value)) throw DomainException({'email': 'Email address is already taken.'});

    return Email(value);
  }

  @override
  Email reconstitute(String value) {
    return Email(value);
  }

  Future<bool> _isEmailTaken(String email) async{
    List<String> result = await _firebaseAuth.fetchSignInMethodsForEmail(email);

    return result.isNotEmpty;
  }
  
}