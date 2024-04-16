import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/providers/providers.dart";
import "package:morse_learn/app_startup.dart";

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: AppSettingsProvider.instance,
          ),
          Provider.value(
            value: ServicesProvider.instance,
          ),
        ],
        child: const AppStartup(),
      ),
    );
