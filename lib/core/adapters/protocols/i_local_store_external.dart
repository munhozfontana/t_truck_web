mixin ILocalStoreExternal {
  Future<Object?>? take(String key);
  Future<void> save(String key, dynamic value);
  Future<bool> remove(String key);
}
