import 'dart:io';

import 'package:flutter/material.dart';

import '../../domain/entities/setting_entity.dart';
import '../../utils/logger.dart';
import '../models/setting/setting_model.dart';
import 'i_mapper.dart';

class SettingMapper implements IMapper<SettingModel, SettingEntity> {
  const SettingMapper();

  @override
  SettingEntity toEntity(SettingModel model) {
    // TODO handle language and country code
    // if no setting use system locale
    try {
      final String defaultLocale = Platform.localeName;
      return SettingEntity(
        locale: Locale.fromSubtags(languageCode: model.locale ?? defaultLocale),
      );
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  SettingModel toModel(SettingEntity entity) {
    try {
      return SettingModel(
        locale: entity.locale.toString(),
      );
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
