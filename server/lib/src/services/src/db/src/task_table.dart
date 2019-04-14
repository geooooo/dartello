import 'package:aqueduct/aqueduct.dart';

import 'package:server/src/services/src/db/src/account_table.dart';
import 'package:server/src/services/src/db/src/group_table.dart';

class Task extends ManagedObject<_Task> implements _Task {}

class _Task {

  @Column(
    primaryKey: true,
    autoincrement: true,
  )
  int id;

  @Column(
    nullable: false,
  )
  String title;

  @Column(
    nullable: false,
  )
  String description;

  @Column(
    nullable: false,
    validators: [
      Validate.oneOf([1, 2, 3]),
    ],
  )
  String priority;

  @Column(
    nullable: false,
    validators: [
      Validate.length(
        greaterThanEqualTo: 0,
        lessThanEqualTo: 100,
      ),
    ],
  )
  String timePoint;

  Group group;

  Account account;

}