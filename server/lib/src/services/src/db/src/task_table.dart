// import 'package:moor/moor.dart';

// class TaskTable extends Table {

//   IntColumn get id => integer().autoIncrement()();

//   TextColumn get title => text().customConstraint('NOT NULL')();

//   TextColumn get description => text().customConstraint('NOT NULL')();

//   IntColumn get priority => integer().customConstraint('NOT NULL CHECK (1 >= priority AND priority <= 3)')();

//   IntColumn get time_point => integer().customConstraint('NOT NULL CHECK (0 >= time_point AND time_point <= 100)')();

//   IntColumn get groupId => integer().customConstraint('NOT NULL FOREIGN KEY(group_id) REFERENCES Group(id)')();

//   IntColumn get accountId => integer().customConstraint('NOT NULL FOREIGN KEY(account_id) REFERENCES Account(id)')();

// }
