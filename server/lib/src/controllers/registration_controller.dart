import 'package:aqueduct/aqueduct.dart';
import 'models/registration.dart';

class RegistrationController extends ResourceController {

  @Operation.post()
  Future<Response> sendRegistration(@Bind.body() RegistrationRequest request) async {
    print(request.asMap());
    final response = RegistrationResponse();
    return Response.ok(response);
  }

}
