import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

import 'package:server/src/internal/di_injector.dart';

class GetDashboardController extends ResourceController {

  final DiInjector _diInjector;

  GetDashboardController(this._diInjector);

  @Operation.post()
  Future<Response> getDashboard(@Bind.body() GetDashboardRequest request) async {
    _diInjector.logger.logRestApi(this.request.method, this.request.path.string, request.asMap());
    final data = await _diInjector.db.selectDashboard(request.login);
    print(data);
    final response = GetDashboardResponse()..readFromMap(data);
    return Response.ok(response);
  }

}

