import 'package:aqueduct/aqueduct.dart' hide Response;
import 'response.dart';

class RegistrationRequest extends Serializable {

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
class RegistrationResponse extends Response {}
