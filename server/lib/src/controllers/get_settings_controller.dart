import 'package:aqueduct/aqueduct.dart';
import '../models/get_settings.dart';

class GetSettingsController extends ResourceController {

  @Operation.post()
  Future<Response> getSettings(@Bind.body() GetSettingsRequest request) async {
    print(request.asMap());
    final response = GetSettingsResponse();
    return Response.ok(response);
  }

}
