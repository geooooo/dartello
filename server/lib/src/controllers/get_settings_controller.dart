import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class GetSettingsController extends ResourceController {

  @Operation.post()
  Future<Response> getSettings(@Bind.body() GetSettingsRequest request) async {
    print(request.asMap());
    final response = GetSettingsResponse();
    return Response.ok(response);
  }

}
