import 'package:aqueduct/aqueduct.dart';

import 'internal/di_injector.dart';
import 'internal/router.dart';
import 'internal/app_logger.dart';
import 'services/services.dart';

class DartelloApp extends ApplicationChannel {

  DiInjector _diInjector;

  @override
  Future<void> prepare() async {
     _diInjector = DiInjector(
        db: Db(),
        logger: AppLogger(),
     );
  }

  @override
  Controller get entryPoint => createRouter(_diInjector);

}
