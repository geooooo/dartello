import 'package:test/test.dart';
import 'package:aqueduct_test/aqueduct_test.dart';

import 'harness/dartello_app.dart';

void main() {
  final harness = DartelloAppHarness()..install(restartForEachTest: true);

  test("", () async {});
}