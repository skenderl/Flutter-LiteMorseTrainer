import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/routes/routes.dart";
import "package:morse_learn/configs/configs.dart";
import "package:morse_learn/widgets/widgets.dart" show AppBarDivider;
import "package:morse_learn/providers/providers.dart";
import "package:morse_learn/extensions/extensions.dart";

const kTileIconColor = Color(0xfff1e4d4);

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ExpansionTileController languageExpansionController =
      ExpansionTileController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151e2c),
        appBar: AppBar(
          bottom: const AppBarDivider(),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color(0xff151e2c),
          elevation: 0,
          title: Text(
            context.watch<AppSettingsProvider?>()?.l10n.settings ??
                "_settings_",
            style: const TextStyle(
              color: kTileIconColor,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              ExpansionTile(
                collapsedShape: Border.all(width: 0),
                shape: Border.all(width: 0),
                leading: const Icon(
                  Icons.language,
                  color: kTileIconColor,
                ),
                controller: languageExpansionController,
                collapsedIconColor: kTileIconColor,
                iconColor: kTileIconColor,
                subtitle: Row(
                  children: [
                    Text(
                      context.watch<AppSettingsProvider?>()?.language.flag ??
                          "_flag_",
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      context.watch<AppSettingsProvider?>()?.language.name ??
                          "_current_language_name_",
                      style: const TextStyle(
                        color: kTileIconColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                title: Text(
                  context
                          .watch<AppSettingsProvider?>()
                          ?.language
                          .l10n
                          .language ??
                      "_language_",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                children: context
                        .watch<AppSettingsProvider?>()
                        ?.supportedLanguages
                        .entries
                        .map(
                          (supportedLanguage) => ListTile(
                            contentPadding: const EdgeInsets.only(left: 45),
                            selectedTileColor: Colors.black38,
                            selected: context
                                    .watch<AppSettingsProvider?>()
                                    ?.language
                                    .name ==
                                supportedLanguage.value.name,
                            leading: Text(
                              supportedLanguage.value.flag,
                              style: const TextStyle(fontSize: 20),
                            ),
                            title: Text(
                              supportedLanguage.key,
                              style: const TextStyle(
                                color: kTileIconColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              context
                                  .read<AppSettingsProvider?>()
                                  ?.changeLanguage(supportedLanguage);

                              languageExpansionController.collapse();
                            },
                          ),
                        )
                        .toList() ??
                    [],
              ),
              const Divider(
                color: Colors.white30,
                height: 0,
                indent: 15,
                endIndent: 30,
              ),
              SwitchListTile(
                secondary: const Icon(
                  Icons.volume_off,
                  color: kTileIconColor,
                ),
                value: context.watch<AppSettingsProvider?>()?.sound ??
                    Configs.defaultSound,
                activeColor: kTileIconColor,
                title: Text(
                  context.watch<AppSettingsProvider?>()?.l10n.sound ??
                      "_sound_sound",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (sound) {
                  context.read<AppSettingsProvider?>()?.changeSound(sound);
                },
              ),
              const Divider(
                color: Colors.white30,
                height: 0,
                indent: 15,
                endIndent: 30,
              ),
              SwitchListTile(
                secondary: const Icon(
                  Icons.vibration,
                  color: kTileIconColor,
                ),
                value: context.watch<AppSettingsProvider?>()?.vibration ??
                    Configs.defaultVibration,
                activeColor: kTileIconColor,
                title: Text(
                  context.watch<AppSettingsProvider?>()?.l10n.vibration ??
                      "_vibration_",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (vibration) {
                  context
                      .read<AppSettingsProvider?>()
                      ?.changeVibration(vibration);
                },
              ),
              const Divider(
                color: Colors.white30,
                height: 0,
                indent: 15,
                endIndent: 30,
              ),
              SwitchListTile(
                secondary: Icon(
                  context.watch<AppSettingsProvider?>()?.singleKeyKeyboard ??
                          Configs.defaultSingleKeyKeyboard
                      ? Icons.keyboard
                      : Icons.keyboard_outlined,
                  color: kTileIconColor,
                ),
                value:
                    context.watch<AppSettingsProvider?>()?.singleKeyKeyboard ??
                        Configs.defaultSingleKeyKeyboard,
                activeColor: kTileIconColor,
                title: Text(
                  context
                          .watch<AppSettingsProvider?>()
                          ?.l10n
                          .singleKeyKeyboard ??
                      "_single_key_keyboard_",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onChanged: (singleKeyKeyboard) {
                  context
                      .read<AppSettingsProvider?>()
                      ?.changeSingleKeyKeyboard(singleKeyKeyboard);
                },
              ),
              const Divider(
                color: Colors.white30,
                height: 0,
                indent: 15,
                endIndent: 30,
              ),
              ListTile(
                leading: const Icon(
                  Icons.keyboard,
                  color: kTileIconColor,
                ),
                enabled: false,
                title: Text(
                  context
                          .watch<AppSettingsProvider?>()
                          ?.l10n
                          .keyboardInputTimeout ??
                      "_keyboard_input_timeout_",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  context
                          .watch<AppSettingsProvider?>()
                          ?.l10n
                          .keyboardInputTimeoutValue(
                            context
                                    .watch<AppSettingsProvider?>()
                                    ?.keyboardTimeout ??
                                Configs.defaultKeyboardTimeout / 1000,
                          ) ??
                      "_timeout_ms_",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Slider(
                activeColor: kTileIconColor,
                inactiveColor: Colors.grey,
                min: 1.0,
                max: 2.5,
                divisions: 6,
                onChanged: (newRating) {
                  context
                      .read<AppSettingsProvider?>()
                      ?.changeKeyboardTimeout((newRating * 1000).toInt());
                },
                value:
                    (context.watch<AppSettingsProvider?>()?.keyboardTimeout ??
                            Configs.defaultKeyboardTimeout) /
                        1000,
              ),
              const Divider(),
              ListTile(
                title: Text(
                  context.watch<AppSettingsProvider?>()?.l10n.translate ??
                      "_translate_",
                  style: const TextStyle(
                    color: kTileIconColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  context.watch<AppSettingsProvider?>()?.l10n.textToMorse ??
                      "_text_to_morse_",
                  style: const TextStyle(
                    color: Color(0xaff1e4d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: const Icon(
                  Icons.translate,
                  color: kTileIconColor,
                ),
                trailing: const Icon(
                  Icons.keyboard_arrow_right,
                  color: kTileIconColor,
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoutes.encode.path);
                },
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    "V ${context.watch<AppSettingsProvider?>()?.appVersionNumber ?? "_0_"}",
                    style: const TextStyle(
                      color: kTileIconColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
