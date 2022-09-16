import 'package:hive_flutter/hive_flutter.dart';

import '../../../utils/logger.dart';
import '../i_local_storage.dart';

class HiveStorage implements ILocalStorage {
  final String hiveBoxName;
  late Box hiveBox;

  HiveStorage(this.hiveBoxName) {
    init();
  }

  @override
  Future<void> init() async {
    try {
      hiveBox = Hive.box(hiveBoxName);
    } catch (e) {
      // if not open then open
      Hive.openBox(hiveBoxName);
      hiveBox = Hive.box(hiveBoxName);
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  Future<void> clear() async {
    try {
      await hiveBox.clear();
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  Future<void> close() async {
    try {
      await hiveBox.close();
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  get(String key) async {
    try {
      return hiveBox.get(key);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  getAll() async {
    try {
      return hiveBox.values.toList();
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  bool has(String key) {
    try {
      return hiveBox.containsKey(key);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  Future<void> remove(String key) async {
    try {
      await hiveBox.delete(key);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }

  @override
  Future<void> set(String? key, data) async {
    try {
      await hiveBox.put(key, data);
    } catch (e) {
      Logger().level(Level.error).at(this).log(e);
      rethrow;
    }
  }
}
