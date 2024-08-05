enum Preferences {
  token 
}

abstract class PreferencesService {
  Future<void> setKeyValue<T>(Preferences key, T value);
  Future<T?> getValue<T>(Preferences key);
  Future<bool> removeKey(Preferences key);
}