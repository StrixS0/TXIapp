import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/repositories/i_customer_repository.dart';
import 'package:txiapp/domain/repositories/i_payment_details_repository.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';

class CustomerServiceImpl implements ICustomerService{
  final ICustomerRepository _customerRepository;
  final IPaymentDetailsRepository _paymentDetailsRepository;

  CustomerServiceImpl(this._customerRepository, this._paymentDetailsRepository);

  @override
  Future<Customer> getCustomerByUserId(UserId userId) async{
    return await _customerRepository.getCustomerByUserId(userId);
  }
  
  @override
  Future<bool> hasPaymentDetails(Customer customer) async{
    return await _paymentDetailsRepository.hasPaymentDetails(customer);
  }
  
  @override
  Future<void> activateCustomer(Customer customer) async{
    final activated = customer.activate();

    await _customerRepository.save(activated);
  }

}