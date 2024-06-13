import 'package:scoped_model/scoped_model.dart';
import 'package:first_app/models/user.dart';

class UserModel extends Model {
  User? _authenticationUser;

  void login(String email, String password) {
    _authenticationUser = User(id: 'sdsds', email: email, password: password);
    notifyListeners();
  }
}
