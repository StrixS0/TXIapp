import 'package:txiapp/domain/models/common/value_objects/email.dart';

abstract class IEmailFactory{
  Future<Email> create(String value);
  Email reconstitute(String value);
}