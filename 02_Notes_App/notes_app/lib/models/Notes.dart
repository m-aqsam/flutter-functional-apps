import 'package:isar/isar.dart';

part 'note.g.dart'; // still not solve

// I am leaving this project as it is and creating new project.

@collection
class Notes {
  Id id = Isar.autoIncrement;
  String? text;
}
