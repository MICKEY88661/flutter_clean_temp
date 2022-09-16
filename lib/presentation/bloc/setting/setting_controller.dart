import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/services/setting_service.dart';
import '../../../utils/logger.dart';
import 'setting_state.dart';

final settingCtrlProvider =
    StateNotifierProvider.autoDispose<SettingController, SettingState>((ref) {
  final settingService = ref.watch(settingServiceProvider);

  return SettingController(
    const SettingState(),
    service: settingService,
  );
});

class SettingController extends StateNotifier<SettingState> {
  final SettingService service;
  SettingController(
    super.state, {
    required this.service,
  }) {
    getSetting();
  }

  Future<void> getSetting() async {
    try {
      final setting = await service.getSetting();
      state = state.copyWith(locale: setting.locale);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
    }
  }

  Future<void> setLocale(Locale l) async {
    try {
      Logger().level(Level.info).at(this).log(l);

      await service.setLocale(l);
      // update state
      await getSetting();
    } catch (e) {
      Logger().level(Level.info).at(this).log(e);
    }
  }
}
