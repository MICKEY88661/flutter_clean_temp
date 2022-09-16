import 'package:flutter/material.dart';
import '../entities/setting_entity.dart';

abstract class ISettingRepository {
  Future<SettingEntity> getSetting();
  Future<void> setLocale(Locale locale);
  // Future<void> setTheme(String theme);
}
