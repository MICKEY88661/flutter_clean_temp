import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// extension 集中處
// https://dart.dev/guides/language/extension-methods

extension ContextEX on BuildContext {
  // 取得MediaQueryData的語法糖
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  // 取得AppLocalizations的語法糖
  AppLocalizations get locale => AppLocalizations.of(this)!;
  // 主題
  ThemeData get theme => Theme.of(this);
  // 顏色
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  // 文字style
  TextTheme get textScheme => Theme.of(this).textTheme;
}
