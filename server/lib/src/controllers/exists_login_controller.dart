import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class ExistsLoginController extends ResourceController {

  @Operation.post()
  Future<Response> existsLogin(@Bind.body() ExistsLoginRequest request) async {
    print(request.asMap());
    final response = ExistsLoginResponse();
    return Response.ok(response);
  }

}

