import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeCtrlProvider =
    StateNotifierProvider.autoDispose<HomeController, int>((ref) {
  return HomeController();
});

class HomeController extends StateNotifier<int> {
  late final PageController homeBodyController;

  HomeController() : super(0) {
    init();
  }
  void init() {
    homeBodyController = PageController();
  }

  @override
  void dispose() {
    homeBodyController.dispose();
    super.dispose();
  }

  // switch home body
  void navigationItemTapped(int index) {
    state = index;
    homeBodyController.jumpToPage(index);
  }
}
