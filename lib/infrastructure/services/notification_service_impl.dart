import 'package:firebase_auth/firebase_auth.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/services/i_notification_service.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class NotificationServiceImpl implements INotificationService{
  @override
  Future<void> sendForgotPasswordNotification(Email email) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.value());
    }on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        throw DomainException({'user': 'The email you entered does not exist in our database. Please enter a valid email.'});
      }

      rethrow;
    }
  }

}