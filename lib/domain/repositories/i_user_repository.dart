import 'package:txiapp/domain/models/user/user.dart';

abstract class IUserRepository{
  Future<User> save(User user);
  void delete(User user);
  Future<bool> isEmailTaken(String email);
}