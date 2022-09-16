import '../../models/setting/setting_model.dart';

abstract class ISettingLocalSource {
  Future<SettingModel> getSetting();
  Future<void> saveSetting(SettingModel setting);
}
