import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

abstract class IPage {
  // 路徑
  final String path;
  // 名字
  final String name;

  const IPage(
    this.path,
    this.name,
  );

  Widget pageBuilder(BuildContext context, GoRouterState state);
}
