import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../bloc/home/home_controller.dart';
import '../../bloc/news/news_controller.dart';
import '../../bloc/setting/setting_controller.dart';
import '../../core/extension.dart';
import '../i_page.dart';

part 'home_screen.dart';
part 'news_body.dart';
part 'home_drawer.dart';

class HomePage implements IPage {
  const HomePage();

  @override
  String get path => '/';

  @override
  String get name => 'home';

  @override
  Widget pageBuilder(BuildContext context, _) {
    return const HomeScreen();
  }
}
