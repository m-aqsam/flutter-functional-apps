import 'package:isar/isar.dart';

part 'note.g.dart'; // still not solve

@collection
class Notes {
  Id id = Isar.autoIncrement;
  String? text;
}
