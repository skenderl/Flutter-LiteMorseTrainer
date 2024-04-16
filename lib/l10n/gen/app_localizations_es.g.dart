import 'app_localizations.g.dart';

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get title => 'Aprenda el código Morse';

  @override
  String get start => 'Comienzo';

  @override
  String get tutorial => 'Tutorial';

  @override
  String get lettersTutorial => 'Letras';

  @override
  String get numbersTutorial => 'Números';

  @override
  String get categoryTitle => 'Seleccionar modo';

  @override
  String get easyCategory => 'Fácil';

  @override
  String get mediumCategory => 'Medio';

  @override
  String get hardCategory => 'Difícil';

  @override
  String share(String link) {
    return 'Mira nuestras aplicaciones: $link';
  }

  @override
  String get settings => 'Configuraciones';

  @override
  String get sound => 'Sonido';

  @override
  String get vibration => 'Vibración';

  @override
  String get keyboardInputTimeout => 'Tiempo de espera de entrada del teclado';

  @override
  String keyboardInputTimeoutValue(Object value) {
    return '$value seg';
  }

  @override
  String get translate => 'Traducir';

  @override
  String get textToMorse => 'Texto a Morse';

  @override
  String get needHelp => '¿Necesitas ayuda?';

  @override
  String get answer => 'Respuesta';

  @override
  String rule(Object number) {
    return 'Regla $number';
  }

  @override
  String get codeDecode => 'Codificar / Decodificar';

  @override
  String get txtToMorse => 'Stringo a Morse';

  @override
  String get typeYourTxt => 'Escribe tu Stringo';

  @override
  String get copyMorse => 'Copiar Morse';

  @override
  String get playMorse => 'Jugar Morse';

  @override
  String get morseCodeRules => 'Reglas del código Morse';

  @override
  String get rule1 => 'La longitud de un punto es una unidad.';

  @override
  String get rule2 => 'Un guión son tres unidades.';

  @override
  String get rule3 => 'El espacio entre símbolos (puntos y guiones) de la misma letra es una unidad.';

  @override
  String get rule4 => 'El espacio entre letras es de tres unidades.';

  @override
  String get rule5 => 'El espacio entre palabras es de siete unidades.';

  @override
  String get alphabet => 'ABCDEFGHIJKLMNOPQRSTUVWXYZÁÉÍÓÚÜÑ';

  @override
  String get singleKeyKeyboard => 'Teclado de una sola tecla';

  @override
  String get language => 'Idioma';

  @override
  String get pageNotFound => '¡Página no encontrada!';

  @override
  String get goBack => 'Regresa';

  @override
  String get error => 'Error !';
}
