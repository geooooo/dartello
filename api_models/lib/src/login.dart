import 'package:aqueduct/aqueduct.dart' hide Response;

import 'package:api_models/src/response.dart';

class LoginRequest extends Serializable {

  String login;
  String password;

  @override
  Map<String, dynamic> asMap() => {
      'login': login,
      'password': password,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    login = inputMap['login'];
    password = inputMap['password'];
  }

}

// status:
//   0 - ок
//   1 - неверный логин или пароль
class LoginReponse extends Response {}

