import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/core/hive/hive_manager.dart';
import 'presentation/bloc/setting/setting_controller.dart';
import 'presentation/pages/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await HiveManager.openBoxes();

  runApp(
    const ProviderScope(
      child: PavoApp(),
    ),
  );
}

//TODO add theme and i18n
class PavoApp extends ConsumerWidget {
  const PavoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final setting = ref.watch(settingCtrlProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        primaryColorDark: Colors.black,
        primarySwatch: Colors.blueGrey,
      ),
      debugShowCheckedModeBanner: false,
      locale: setting.locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
