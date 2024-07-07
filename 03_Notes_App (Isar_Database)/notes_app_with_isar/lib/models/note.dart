import 'package:isar/isar.dart';

part 'note.g.dart'; // Error not sloved...

@Collection()
class Note {
  Id id = Isar.autoIncrement;
  late String text;
}
 