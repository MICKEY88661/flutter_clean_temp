import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// TODO add theme
class SettingEntity extends Equatable {
  final Locale locale;

  const SettingEntity({
    required this.locale,
  });

  @override
  List<Object?> get props => [locale];
}
