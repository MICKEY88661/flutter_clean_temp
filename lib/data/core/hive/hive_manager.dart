import 'package:hive_flutter/hive_flutter.dart';

import '../../../utils/logger.dart';
import '../key.dart';

class HiveManager {
  static Future<void> openBoxes() async {
    try {
      await Hive.openBox(settingHiveKey);
    } catch (e) {
      Logger().level(Level.error).at(HiveManager).log(e);
    }
  }
}
