import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';

class GetTeamMemberRequest{
  final CustomerId _customerId;

  GetTeamMemberRequest(this._customerId);

  CustomerId customerId(){
    return _customerId;
  }
}