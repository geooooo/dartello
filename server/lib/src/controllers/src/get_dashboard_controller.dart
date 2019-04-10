import 'package:aqueduct/aqueduct.dart';
import 'package:api_models/api_models.dart';

class GetDashboardController extends ResourceController {

  @Operation.post()
  Future<Response> getDashboard(@Bind.body() GetDashboardRequest request) async {
    print(request.asMap());
    final response = GetDashboardResponse();
    return Response.ok(response);
  }

}

