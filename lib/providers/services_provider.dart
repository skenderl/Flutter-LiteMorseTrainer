import "package:morse_learn/services/services.dart";

/// `ServicesProvider.init` Must be called before `ServicesProvider` is used:
/// ```dart
/// await ServicesProvider.init();
/// ```
class ServicesProvider {
  ServicesProvider._();

  static final ServicesProvider _instance = ServicesProvider._();
  static ServicesProvider get instance => _instance;

  static late final SharedPrefsService _sharedPrefsService;

  SharedPrefsService get sharedPrefsService => _sharedPrefsService;

  static Future<void> init() async {
    _sharedPrefsService = await SharedPrefsService.init();
  }
}
