import 'package:phone_number/phone_number.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/phone_number.dart' as domain_phone_number;
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class PhoneNumberFactoryImpl implements IPhoneNumberFactory{
  @override
  Future<domain_phone_number.PhoneNumber> create(String value) async{
    PhoneNumberUtil phoneNumberUtil = PhoneNumberUtil();
   
    bool isValid = await phoneNumberUtil.validate(value, regionCode: "US");
    
    if(!isValid) throw DomainException({'phoneNumber': 'Invalid phone number.'});

    String formatted = await PhoneNumberUtil().format(value, "US");

    return domain_phone_number.PhoneNumber(formatted);
  }

  @override
  domain_phone_number.PhoneNumber reconstitute(String value) {
    return domain_phone_number.PhoneNumber(value);
  }

}