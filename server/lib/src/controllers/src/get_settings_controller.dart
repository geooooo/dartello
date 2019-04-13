import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class GetSettingsController extends ResourceController {

  final DiInjector _diInjector;

  GetSettingsController(this._diInjector);

  @Operation.post()
  Future<Response> getSettings(@Bind.body() GetSettingsRequest request) async {
    print(request.asMap());
    final response = GetSettingsResponse();
    return Response.ok(response);
  }

}
