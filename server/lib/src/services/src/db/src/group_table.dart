import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/services/src/db/src/dashboard_table.dart';

class Group extends ManagedObject<_Group> implements _Group {}

class _Group {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Column(
    nullable: false,
  )
  String title;

  Dashboard dashboard;

}
