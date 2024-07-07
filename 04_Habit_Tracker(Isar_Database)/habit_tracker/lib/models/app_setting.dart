import 'package:isar/isar.dart';

// dart run build_runner build

part 'app_setting.g.dart';

@collection
class AppSetting {
  Id id = Isar.autoIncrement;
  DateTime? firstLaunchDate;
}
