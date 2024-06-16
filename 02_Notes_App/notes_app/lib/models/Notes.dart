import 'package:isar/isar.dart';

//part 'note.g.dart';

@collection
class Notes {
  Id id = Isar.autoIncrement;
  String? text;
}
