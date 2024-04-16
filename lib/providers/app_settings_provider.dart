import "dart:io" show Platform;
import "dart:ui" show Locale;
import "dart:convert" show json;

import "package:flutter/foundation.dart" show ChangeNotifier, visibleForTesting;

import "package:package_info_plus/package_info_plus.dart";

import "package:morse_learn/l10n/l10n.dart";
import "package:morse_learn/types/types.dart";
import "package:morse_learn/configs/configs.dart";
import "package:morse_learn/extensions/extensions.dart";

/// `AppSettingsProvider.init` Must be called before `AppSettingsProvider` is used:
/// ```dart
/// await AppSettingsProvider.init();
/// ```
class AppSettingsProvider with ChangeNotifier {
  AppSettingsProvider._();

  static final AppSettingsProvider _instance = AppSettingsProvider._();
  static AppSettingsProvider get instance => _instance;

  Locale _language = AppLocalizations.supportedLocales.firstWhere(
    (locale) => locale == Locale(Platform.localeName.split("_").first),
    orElse: () => Configs.defaultLanguage,
  );
  bool _sound = Configs.defaultSound;
  bool _vibration = Configs.defaultVibration;
  bool _singleKeyKeyboard = Configs.defaultSingleKeyKeyboard;
  int _keyboardTimeout = Configs.defaultKeyboardTimeout;
  String _appVersion = "0.0.0";
  StringCallback? _changeLanguageCallback;
  BoolCallback? _changeSoundCallback;
  BoolCallback? _changeVibrationCallback;
  BoolCallback? _changeSingleKeyKeyboardCallback;
  IntCallback? _changeKeyboardTimeoutCallback;

  @visibleForTesting
  void update({
    String? appVersion,
    String? languageName,
    bool? sound,
    bool? vibration,
    bool? singleKeyKeyboard,
    int? keyboardTimeout,
    StringCallback? changeLanguageCallback,
    BoolCallback? changeSoundCallback,
    BoolCallback? changeVibrationCallback,
    BoolCallback? changeSingleKeyKeyboardCallback,
    IntCallback? changeKeyboardTimeoutCallback,
  }) {
    if (appVersion != null) {
      _appVersion = appVersion;
    }

    if (languageName != null) {
      _language =
          AppLocalizationsExtension.supportedLanguages.values.firstWhere(
        (langName) => langName.name == languageName,
        orElse: () => Configs.defaultLanguage,
      );
    }

    if (changeLanguageCallback != null) {
      _changeLanguageCallback = changeLanguageCallback;
    }

    if (sound != null) {
      _sound = sound;
    }

    if (changeSoundCallback != null) {
      _changeSoundCallback = changeSoundCallback;
    }

    if (vibration != null) {
      _vibration = vibration;
    }

    if (changeVibrationCallback != null) {
      _changeVibrationCallback = changeVibrationCallback;
    }

    if (singleKeyKeyboard != null) {
      _singleKeyKeyboard = singleKeyKeyboard;
    }

    if (changeSingleKeyKeyboardCallback != null) {
      _changeSingleKeyKeyboardCallback = changeSingleKeyKeyboardCallback;
    }

    if (keyboardTimeout != null) {
      _keyboardTimeout = keyboardTimeout;
    }

    if (changeKeyboardTimeoutCallback != null) {
      _changeKeyboardTimeoutCallback = changeKeyboardTimeoutCallback;
    }

    notifyListeners();
  }

  Locale get language => _language;
  bool get sound => _sound;
  bool get vibration => _vibration;
  bool get singleKeyKeyboard => _singleKeyKeyboard;
  int get keyboardTimeout => _keyboardTimeout;
  String get appVersionNumber => _appVersion;
  AppLocalizations get l10n => _language.l10n;
  Map<String, Locale> get supportedLanguages =>
      AppLocalizationsExtension.supportedLanguages;

  static Future<AppSettingsProvider> init({
    String? initialLanguageName,
    bool? initialSound,
    bool? initialVibration,
    bool? initialSingleKeyKeyboard,
    int? initialKeyboardTimeout,
    StringCallback? changeLanguageCallback,
    BoolCallback? changeSoundCallback,
    BoolCallback? changeVibrationCallback,
    BoolCallback? changeSingleKeyKeyboardCallback,
    IntCallback? changeKeyboardTimeoutCallback,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();

    instance.update(
      appVersion: "${packageInfo.version} (${packageInfo.buildNumber})",
      languageName: initialLanguageName,
      changeLanguageCallback: changeLanguageCallback,
      sound: initialSound,
      changeSoundCallback: changeSoundCallback,
      vibration: initialVibration,
      changeVibrationCallback: changeVibrationCallback,
      singleKeyKeyboard: initialSingleKeyKeyboard,
      changeSingleKeyKeyboardCallback: changeSingleKeyKeyboardCallback,
      keyboardTimeout: initialKeyboardTimeout,
      changeKeyboardTimeoutCallback: changeKeyboardTimeoutCallback,
    );

    return _instance;
  }

  void changeLanguage(MapEntry<String, Locale> selectedLanguage) {
    if (selectedLanguage.value != language) {
      _changeLanguageCallback?.call(selectedLanguage.key);
      _language = selectedLanguage.value;
      notifyListeners();
    }
  }

  void changeSound(bool sound) {
    if (sound != _sound) {
      _changeSoundCallback?.call(sound);
      _sound = sound;
      notifyListeners();
    }
  }

  void changeVibration(bool vibration) {
    if (vibration != _vibration) {
      _changeVibrationCallback?.call(vibration);
      _vibration = vibration;
      notifyListeners();
    }
  }

  void changeSingleKeyKeyboard(bool singleKeyKeyboard) {
    if (singleKeyKeyboard != _singleKeyKeyboard) {
      _changeSingleKeyKeyboardCallback?.call(singleKeyKeyboard);
      _singleKeyKeyboard = singleKeyKeyboard;
      notifyListeners();
    }
  }

  void changeKeyboardTimeout(int timeout) {
    if (timeout != _keyboardTimeout) {
      _changeKeyboardTimeoutCallback?.call(timeout);
      _keyboardTimeout = timeout;
      notifyListeners();
    }
  }

  Map<String, dynamic> toJson() {
    return {
      "appVersionNumber": appVersionNumber,
      "language": language.name,
      "sound": sound,
      "vibration": vibration,
      "singleKeyKeyboard": singleKeyKeyboard,
      "keyboardTimeout": keyboardTimeout,
    };
  }

  @override
  String toString() {
    return json.encode(toJson());
  }
}
