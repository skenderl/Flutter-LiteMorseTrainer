import "package:flutter/material.dart";

import "package:provider/provider.dart";

import "package:morse_learn/providers/providers.dart";
import "package:morse_learn/extensions/extensions.dart";

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.05,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
              ),
              margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.05,
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              child: const Padding(
                padding: EdgeInsets.only(
                  bottom: 10,
                ),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Text(
              context.watch<AppSettingsProvider?>()?.l10n.error ?? "_error_",
              style: TextStyle(
                fontFamily: Theme.of(
                  context,
                ).textTheme.bodyLarge?.fontFamily,
                fontSize: 32,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.48,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Text(
              context.watch<AppSettingsProvider?>()?.l10n.pageNotFound ??
                  "_description_callback_error_",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.036,
                    letterSpacing: -0.25,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 52,
            ),
            child: MaterialButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              color: Theme.of(context).textTheme.bodyLarge?.color?.lighten,
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Text(
                context.watch<AppSettingsProvider?>()?.l10n.goBack ??
                    "_actionText_callback_error_",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color:
                          Theme.of(context).textTheme.bodyLarge?.color?.darken,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
