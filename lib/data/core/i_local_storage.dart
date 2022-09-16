abstract class ILocalStorage {
  Future<void> init();

  Future<void> close();

  dynamic get(String key);

  dynamic getAll();

  Future<void> set(String? key, dynamic data);

  Future<void> remove(String key);

  Future<void> clear();

  bool has(String key);
}
