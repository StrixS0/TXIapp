import 'package:txiapp/domain/models/common/value_objects/phone_number.dart';

abstract class IPhoneNumberFactory{
  Future<PhoneNumber> create(String value);
  PhoneNumber reconstitute(String value);
}