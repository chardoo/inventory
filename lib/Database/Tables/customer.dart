import 'package:drift/drift.dart';


@DataClassName('CustomerCategory')
class CustomerCategories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedDate => dateTime().nullable()();
}


class Customers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get lastName => text()();
  TextColumn get email => text()();
  TextColumn get phoneNumber => text()();
  TextColumn get address => text()();
  IntColumn get categoryId => integer().nullable().references(CustomerCategories, #id)();
  DateTimeColumn get createdDate => dateTime().withDefault(Constant(DateTime.now()))();
  DateTimeColumn get updatedDate => dateTime().nullable()();
}
