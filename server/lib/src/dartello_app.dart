import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/internal/di_injector.dart';
import 'package:server/src/internal/managed_context.dart';
import 'package:server/src/internal/router.dart';

class DartelloApp extends ApplicationChannel {

  DiInjector _diInjector;

  @override
  Future<void> prepare() async {
     _diInjector = DiInjector(
         managedContext: createManagedContext()
     );
  }

  @override
  Controller get entryPoint => createRouter(_diInjector);

}
