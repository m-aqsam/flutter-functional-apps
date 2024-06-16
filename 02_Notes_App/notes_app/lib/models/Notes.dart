import 'package:isar/isar.dart';

part 'note.g.dart'; // error trying to solve

@collection
class Notes {
  Id id = Isar.autoIncrement;
  String? text;
}
