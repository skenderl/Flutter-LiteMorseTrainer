import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "package:provider/provider.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/widgets/widgets.dart";
import "package:morse_learn/providers/providers.dart";

class EncodeScreen extends StatefulWidget {
  const EncodeScreen({super.key});

  @override
  State<EncodeScreen> createState() => _EncodeScreenState();
}

class _EncodeScreenState extends State<EncodeScreen> {
  late final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff151e2c),
        appBar: AppBar(
          bottom: const AppBarDivider(),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: const Color(0xff151e2c),
          elevation: 0,
          title: Text(
            context.watch<AppSettingsProvider?>()?.l10n.codeDecode ??
                "_code_decode_",
            style: const TextStyle(
              color: Color(0xfff1e4d4),
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
              ListTile(
                enabled: false,
                title: Text(
                  context.watch<AppSettingsProvider?>()?.l10n.txtToMorse ??
                      "_txt_to_morse_",
                  style: const TextStyle(
                    color: Color(0xfff1e4d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                margin: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  controller: inputController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintStyle: const TextStyle(
                      color: Colors.white30,
                    ),
                    border: const OutlineInputBorder(),
                    hintText: context
                            .watch<AppSettingsProvider?>()
                            ?.l10n
                            .typeYourTxt ??
                        "_type_your_txt_",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FittedBox(
                    child: MaterialButton(
                      onPressed: () {
                        Clipboard.setData(
                          ClipboardData(
                              text: Sentence(inputController.text).toString(),),
                        );
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Icon(
                            Icons.content_copy,
                            color: Colors.white,
                          ),
                          Text(
                            context
                                    .watch<AppSettingsProvider?>()
                                    ?.l10n
                                    .copyMorse ??
                                "_copy_morse_",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    child: MaterialButton(
                      onPressed: () {
                        Sentence(inputController.text).play();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                          Text(
                            context
                                    .watch<AppSettingsProvider?>()
                                    ?.l10n
                                    .playMorse ??
                                "_play_morse_",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                enabled: false,
                title: Text(
                  context.watch<AppSettingsProvider?>()?.l10n.morseCodeRules ??
                      "_morse_code_rules_",
                  style: const TextStyle(
                    color: Color(0xfff1e4d4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ...List<Widget>.generate(
                5,
                (ruleIdx) => ListTile(
                  title: Text(
                    context
                            .watch<AppSettingsProvider?>()
                            ?.l10n
                            .rule(ruleIdx + 1) ??
                        "_rule_X_",
                    style: const TextStyle(
                      color: Color(0xfff1e4d4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    ruleIdx == 0
                        ? context.watch<AppSettingsProvider?>()?.l10n.rule1 ??
                            "_rule_1_"
                        : ruleIdx == 1
                            ? context
                                    .watch<AppSettingsProvider?>()
                                    ?.l10n
                                    .rule2 ??
                                "_rule_2_"
                            : ruleIdx == 2
                                ? context
                                        .watch<AppSettingsProvider?>()
                                        ?.l10n
                                        .rule3 ??
                                    "_rule_3_"
                                : ruleIdx == 3
                                    ? context
                                            .watch<AppSettingsProvider?>()
                                            ?.l10n
                                            .rule4 ??
                                        "_rule_4_"
                                    : ruleIdx == 4
                                        ? context
                                                .watch<AppSettingsProvider?>()
                                                ?.l10n
                                                .rule5 ??
                                            "_rule_5_"
                                        : "¯\\_(ツ)_/¯",
                    style: const TextStyle(
                      color: Color(0xaff1e4d4),
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
