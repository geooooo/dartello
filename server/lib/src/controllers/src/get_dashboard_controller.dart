import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class GetDashboardController extends ResourceController {

  final DiInjector _diInjector;

  GetDashboardController(this._diInjector);

  @Operation.post()
  Future<Response> getDashboard(@Bind.body() GetDashboardRequest request) async {
    print(request.asMap());
    final response = GetDashboardResponse();
    return Response.ok(response);
  }

}

