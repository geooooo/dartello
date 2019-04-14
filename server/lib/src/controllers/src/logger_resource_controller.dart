import 'package:aqueduct/aqueduct.dart';

class LoggerResourceController extends ResourceController {

  String method;
  String uri;

  @override
  Future<RequestOrResponse> handle(Request request) async {
    method = request.method;
    uri = request.path.string;
    await super.handle(request);
    return request;
  }

}