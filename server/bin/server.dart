import 'package:server/server.dart';

Future<void> main() async => await run(
  port: 80,
  isolatesCount: 1,
);