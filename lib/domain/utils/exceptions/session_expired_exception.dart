import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class SessionExpiredException extends DomainException{
  SessionExpiredException(super.cause);
}