import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';
import 'package:txiapp/domain/repositories/i_payment_details_repository.dart';
import 'package:txiapp/infrastructure/entitites/stripe_card_entity.dart';

class PaymentDetailsRepositoryImpl implements IPaymentDetailsRepository{
  
  @override
  Future<void> save(IPaymentDetails paymentDetails) async{
    await FirebaseFirestore.instance.collection('payment_details')
      .doc(paymentDetails.getId().id())
      .set(_toJson(paymentDetails));
  }

  Map<String, dynamic> _toJson(IPaymentDetails paymentDetails){
    return {
      'type': paymentDetails is StripeCardEntity ? 'card' : '',
      'gateway': paymentDetails is StripeCardEntity ? 'stripe' : '',
      'customerId': paymentDetails.getCustomerId().id(),
      'details': paymentDetails.details(),
      'created': DateTime.now().toString(),
      'modified': DateTime.now().toString()
    };
  }

  @override
  Future<bool> hasPaymentDetails(Customer customer) async{
    final paymentDetailsRef = FirebaseFirestore.instance.collection('payment_details');

    final result = await paymentDetailsRef.where('customerId', isEqualTo: customer.id().id()).count().get();

    return result.count > 0;
  }
  
  @override
  Future<IPaymentDetails?> getDefaultPaymentDetails(Customer customer) async{
    final paymentDetailsRef = FirebaseFirestore.instance.collection('payment_details');

    final result = await paymentDetailsRef.where('customerId', isEqualTo: customer.id().id()).limit(1).get();

    if(result.docs.isEmpty) return null;

    return _fromSnapshot(result.docs[0]);
  }

  IPaymentDetails _fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapShot){
    return StripeCardEntity(PaymentDetailsId(snapShot.id), CustomerId(snapShot.data()['customerId']), {
        'brand': snapShot.data()['details']['brand'],
        'country': snapShot.data()['details']['country'],
        'expirationMonth': snapShot.data()['details']['expirationMonth'],
        'expirationYear': snapShot.data()['details']['expirationYear'],
        'last4': snapShot.data()['details']['last4'],
        'customerId': snapShot.data()['details']['customerId']
      });
  }

}