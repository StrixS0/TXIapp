import 'package:email_validator/email_validator.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class EmailFactoryImpl extends IEmailFactory{

  @override
  Future<Email> create(String value) async{
    if(!EmailValidator.validate(value)) throw DomainException({'email': 'Invalid Email address.'});

    return Email(value);
  }

  @override
  Email reconstitute(String value) {
    return Email(value);
  }
}