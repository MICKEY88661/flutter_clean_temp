import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pavo11_flutter/data/models/setting/setting_model.dart';

import '../../domain/entities/setting_entity.dart';
import '../../domain/i_repositories/i_setting_repo.dart';
import '../../utils/logger.dart';
import '../core/hive/hive_storage.dart';
import '../core/key.dart';
import '../data_sources/setting/i_setting_local_source.dart';
import '../data_sources/setting/setting_local_source.dart';
import '../mappers/setting_mapper.dart';

final settingRepoProvider = Provider<ISettingRepository>((ref) {
  return SettingRepository(
    SettingLocalSource(HiveStorage(settingHiveKey)),
    const SettingMapper(),
  );
});

class SettingRepository implements ISettingRepository {
  final ISettingLocalSource localSource;
  final SettingMapper mapper;
  const SettingRepository(this.localSource, this.mapper);

  @override
  Future<SettingEntity> getSetting() async {
    try {
      final settingModel = await localSource.getSetting();
      final settingEntity = mapper.toEntity(settingModel);
      return settingEntity;
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);

      rethrow;
    }
  }

  @override
  Future<void> setLocale(Locale locale) async {
    try {
      final settingModel = await localSource.getSetting();
      Map<String, dynamic> settingJson = settingModel.toJson();
      settingJson["locale"] = locale.toString();
      final newSetting = SettingModel.fromJson(settingJson);
      await localSource.saveSetting(newSetting);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);

      rethrow;
    }
  }
}
