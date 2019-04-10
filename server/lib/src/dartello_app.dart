import 'package:aqueduct/aqueduct.dart';
import 'router.dart';

class DartelloApp extends ApplicationChannel {

  @override
  Future<void> prepare() async => null;

  @override
  Controller get entryPoint => router;

}
