import 'package:isar/isar.dart';

// dart run build_runner build

part 'habit.g.dart';


@collection
class Habit {
  // habit id
  Id id = Isar.autoIncrement;

  // habit name

  late String name;

  //completed days 

  List<DateTime> completeDays = [];

  // DateTime(year,month,day)
  // DateTime(2024,07,23)
}
