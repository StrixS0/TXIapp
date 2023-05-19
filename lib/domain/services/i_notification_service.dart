import 'package:txiapp/domain/models/common/value_objects/email.dart';

abstract class INotificationService{
  Future<void> sendForgotPasswordNotification(Email email);
}