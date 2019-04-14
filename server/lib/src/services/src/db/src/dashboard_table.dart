import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/services/src/db/src/team_table.dart';
import 'package:server/src/services/src/db/src/group_table.dart';

class Dashboard extends ManagedObject<_Dashboard> implements _Dashboard {}

class _Dashboard {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Relate(#dashboard)
  Team team;

  @Relate(#group)
  Group group;

}