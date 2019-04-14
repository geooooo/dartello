import 'package:aqueduct/aqueduct.dart';

import 'internal/di_injector.dart';
import 'internal/router.dart';
import 'services/services.dart';

class DartelloApp extends ApplicationChannel {

  DiInjector _diInjector;

  @override
  Future<void> prepare() async {
     _diInjector = DiInjector(
        db: Db(),
     );
  }

  @override
  Controller get entryPoint => createRouter(_diInjector);

}
