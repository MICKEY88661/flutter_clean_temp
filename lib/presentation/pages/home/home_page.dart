import 'package:flutter/material.dart';
import '../i_page.dart';

part 'home_screen.dart';

class HomePage implements IPage {
  @override
  String get path => '/';

  @override
  String get name => 'home';

  @override
  Widget pageBuilder(BuildContext context, _) {
    return const HomeScreen();
  }
}
