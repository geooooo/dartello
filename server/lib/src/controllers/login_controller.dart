import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class LoginController extends ResourceController {

  @Operation.post()
  Future<Response> sendLogin(@Bind.body() LoginRequest request) async {
    print(request.asMap());
    final response = LoginReponse();
    return Response.ok(response);
  }

}

