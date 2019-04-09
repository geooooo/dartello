import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class LoginRequest extends Serializable {

  String login;
  String password;

  Map<String, dynamic> asMap() => {
      "login": login,
      "password": password,
  };

  void readFromMap(Map<String, dynamic> inputMap) {
    login = inputMap['login'];
    password = inputMap['password'];
  }

}

// status:
//   0 - ок
//   1 - неверный логин или пароль
class LoginReponse extends Response {}

