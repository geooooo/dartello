import 'package:aqueduct/aqueduct.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

import 'package:server/src/dartello_app.dart';
import 'package:server/src/internal/app_config.dart';
import 'package:server/src/services/services.dart';

class DartelloAppHarness extends TestHarness<DartelloApp> with TestHarnessORMMixin {

  @override
  ManagedContext get context => channel.diInjector.db.managedContext;

  @override
  Future<void> onSetUp() async {
    channel.appConfig = AppConfig(AppConfig.testConfigPath);
    channel.diInjector.db = Db(channel.appConfig);
    await resetData();
  }

  @override
  Future<void> seed() async {
    return null;
  }

}