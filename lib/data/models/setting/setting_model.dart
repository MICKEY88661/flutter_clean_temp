import 'package:json_annotation/json_annotation.dart';

import '../../../utils/logger.dart';

part 'setting_model.g.dart';

@JsonSerializable()
class SettingModel {
  final String? locale;

  const SettingModel({
    this.locale,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    try {
      return _$SettingModelFromJson(json);
    } catch (e) {
      Logger().level(Level.error).at(SettingModel).log(e);
      rethrow;
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return _$SettingModelToJson(this);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
