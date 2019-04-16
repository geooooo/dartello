import 'package:aqueduct/aqueduct.dart' hide Response;

import 'package:api_models/src/response.dart';

class GetSettingsRequest extends Serializable {

  String login;

  @override
  Map<String, dynamic> asMap() => {
    'login': login,
  };

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    login = inputMap['login'];
  }

}

// status:
//   0 - ок
class GetSettingsResponse extends Response {

  List<String> logins = [];

  @override
  Map<String, dynamic> asMap() => super.asMap()..addAll({
      'logins': logins,
  });

  @override
  void readFromMap(Map<String, dynamic> inputMap) {
    super.readFromMap(inputMap);
    logins = inputMap['logins'];
  }

}
