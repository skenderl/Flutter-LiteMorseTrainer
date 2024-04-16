import "package:morse_learn/configs/configs.dart";
import "package:shared_preferences/shared_preferences.dart";

const String _settingsLanguageKey = "settings_lang_key";
const String _settingsSoundKey = "settings_sound_key";
const String _settingsVibrationKey = "settings_vibration_key";
const String _settingsKeyboardTimeoutKey = "settings_keyboard_timeout_key";
const String _settingsSingleKeyKeyboardKey = "settings_single_key_keyboard_key";

/// `SharedPrefsStorageService.init` Must be called before `SharedPrefsStorageService` is used:
/// ```dart
/// await SharedPrefsStorageService.init();
/// ```
class SharedPrefsService {
  SharedPrefsService._();

  static SharedPreferences? _prefs;

  static Future<SharedPrefsService> init() async {
    _prefs ??= await SharedPreferences.getInstance();

    return SharedPrefsService._();
  }

  String getAppLanguage() {
    return _prefs?.getString(_settingsLanguageKey) ??
        Configs.defaultLanguage.languageCode;
  }

  Future<bool>? setAppLanguage(String value) {
    return _prefs?.setString(_settingsLanguageKey, value);
  }

  Future<bool>? deleteAppLanguage() {
    return _prefs?.remove(_settingsLanguageKey);
  }

  bool getAppSound() {
    return _prefs?.getBool(_settingsSoundKey) ?? Configs.defaultSound;
  }

  Future<bool>? setAppSound(bool value) {
    return _prefs?.setBool(_settingsSoundKey, value);
  }

  Future<bool>? deleteAppSound() {
    return _prefs?.remove(_settingsSoundKey);
  }

  bool getAppVibration() {
    return _prefs?.getBool(_settingsVibrationKey) ?? Configs.defaultVibration;
  }

  Future<bool>? setAppVibration(bool value) {
    return _prefs?.setBool(_settingsVibrationKey, value);
  }

  Future<bool>? deleteAppVibration() {
    return _prefs?.remove(_settingsVibrationKey);
  }

  int getAppKeyboardTimeout() {
    return _prefs?.getInt(_settingsKeyboardTimeoutKey) ??
        Configs.defaultKeyboardTimeout;
  }

  Future<bool>? setAppKeyboardTimeout(int value) {
    return _prefs?.setInt(_settingsKeyboardTimeoutKey, value);
  }

  Future<bool>? deleteAppKeyboardTimeout() {
    return _prefs?.remove(_settingsKeyboardTimeoutKey);
  }

  bool getAppSingleKeyKeyboard() {
    return _prefs?.getBool(_settingsSingleKeyKeyboardKey) ??
        Configs.defaultSingleKeyKeyboard;
  }

  Future<bool>? setAppSingleKeyKeyboard(bool value) {
    return _prefs?.setBool(_settingsSingleKeyKeyboardKey, value);
  }

  Future<bool>? deleteAppSingleKeyKeyboard() {
    return _prefs?.remove(_settingsSingleKeyKeyboardKey);
  }
}
