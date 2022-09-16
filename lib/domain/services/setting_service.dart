import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories_impl/setting_repo_impl.dart';
import '../../utils/logger.dart';
import '../entities/setting_entity.dart';
import '../i_repositories/i_setting_repo.dart';

final settingServiceProvider = Provider<SettingService>((ref) {
  final settingRepo = ref.watch(settingRepoProvider);
  return SettingService(settingRepo);
});

class SettingService {
  final ISettingRepository settingRepository;
  const SettingService(this.settingRepository);

  Future<SettingEntity> getSetting() async {
    try {
      final setting = await settingRepository.getSetting();
      return setting;
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);

      rethrow;
    }
  }

  Future<void> setLocale(Locale l) async {
    try {
      await settingRepository.setLocale(l);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);

      rethrow;
    }
  }
}
