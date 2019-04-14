import 'package:server/src/services/services.dart';
import 'app_logger.dart';

class DiInjector {

  final Db db;
  final AppLogger logger;

  DiInjector({this.db, this.logger});

}