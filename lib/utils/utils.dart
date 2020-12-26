export './ColorsList.dart';
export './CharactersLists.dart';
export './words/words.dart';

final List<String> numbers = List<String>.generate(10, (idx) => idx.toString());

List<String> getLetters(String alphabet) =>
    List<String>.generate(alphabet.length, (idx) => alphabet[idx]);

String getLanguage(String languageCode) => languages[languageCode];

const Map<String, String> languages = {
  "en": "English",
  "fr": "Français",
  "es": "Español",
  "de": "Deutsche"
};
