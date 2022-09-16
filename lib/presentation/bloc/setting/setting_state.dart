import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SettingState extends Equatable {
  final Locale? locale;
  const SettingState({this.locale});

  SettingState copyWith({
    Locale? locale,
  }) {
    return SettingState(
      locale: locale ?? this.locale,
    );
  }

  @override
  List<Object?> get props => [locale];
}
