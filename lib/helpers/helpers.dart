import "package:morse_learn/providers/providers.dart";

export "./assets_helpers.dart";
export "./transition_helpers.dart";

Future<void> initProviders() async {
  await ServicesProvider.init();

  await AppSettingsProvider.init(
    initialLanguageName:
        ServicesProvider.instance.sharedPrefsService.getAppLanguage(),
    changeLanguageCallback:
        ServicesProvider.instance.sharedPrefsService.setAppLanguage,
    initialSound: ServicesProvider.instance.sharedPrefsService.getAppSound(),
    changeSoundCallback:
        ServicesProvider.instance.sharedPrefsService.setAppSound,
    initialVibration:
        ServicesProvider.instance.sharedPrefsService.getAppVibration(),
    changeVibrationCallback:
        ServicesProvider.instance.sharedPrefsService.setAppVibration,
    initialSingleKeyKeyboard:
        ServicesProvider.instance.sharedPrefsService.getAppSingleKeyKeyboard(),
    changeSingleKeyKeyboardCallback:
        ServicesProvider.instance.sharedPrefsService.setAppSingleKeyKeyboard,
    initialKeyboardTimeout:
        ServicesProvider.instance.sharedPrefsService.getAppKeyboardTimeout(),
    changeKeyboardTimeoutCallback:
        ServicesProvider.instance.sharedPrefsService.setAppKeyboardTimeout,
  );
}
