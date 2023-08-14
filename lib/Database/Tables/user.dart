import 'package:drift/drift.dart';


class Roles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get roleName => text()();
  TextColumn get roleDescription => text().nullable()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedDate => dateTime().nullable()();
}


class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get address => text()();
  DateTimeColumn get hireDate => dateTime().nullable()();
  IntColumn get roleId => integer().nullable().references(Roles, #id)();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedDate => dateTime().nullable()();
}
