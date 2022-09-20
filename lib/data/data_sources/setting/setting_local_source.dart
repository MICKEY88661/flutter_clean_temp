import 'dart:convert';

import '../../../utils/logger.dart';
import '../../models/setting/setting_model.dart';
import '../../core/i_local_storage.dart';
import '../../core/key.dart';
import 'i_setting_local_source.dart';

class SettingLocalSource implements ISettingLocalSource {
  final ILocalStorage storage;
  const SettingLocalSource(this.storage);

  @override
  Future<SettingModel> getSetting() async {
    try {
      final String? rawSetting =
          await storage.get(HiveConstants.settingHiveKey);
      if (rawSetting == null) return const SettingModel();

      final Map<String, dynamic> jsonSetting = jsonDecode(rawSetting);

      return SettingModel.fromJson(jsonSetting);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  Future<void> saveSetting(SettingModel setting) async {
    try {
      final jsonSetting = setting.toJson();
      final rawSetting = jsonEncode(jsonSetting);
      await storage.set(HiveConstants.settingHiveKey, rawSetting);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
