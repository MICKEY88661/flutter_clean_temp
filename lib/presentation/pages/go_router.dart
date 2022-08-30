import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'home/home_page.dart';

final goRouterProvider = Provider((ref) {
  const home = HomePage();

  return GoRouter(
    routes: [
      GoRoute(
        path: home.path,
        name: home.name,
        builder: home.pageBuilder,
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(state.error.toString()),
          ),
        ),
      );
    },
  );
});
