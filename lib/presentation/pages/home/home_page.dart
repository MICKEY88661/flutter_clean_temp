import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../bloc/news_controller.dart';
import '../i_page.dart';

part 'home_screen.dart';

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
