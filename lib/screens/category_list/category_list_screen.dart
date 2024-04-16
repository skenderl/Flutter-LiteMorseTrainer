import "dart:math";

import "package:flutter/material.dart";
import "package:morse_learn/widgets/widgets.dart";

import "package:provider/provider.dart";

import "package:morse_learn/models/models.dart";
import "package:morse_learn/routes/routes.dart";
import "package:morse_learn/providers/providers.dart";

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({
    required this.categories, super.key,
  });

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    final buttonPadding = min(
      30.0,
      max(
            MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height,
          ) *
          0.02,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff151e2c),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            context.watch<AppSettingsProvider?>()?.l10n.categoryTitle ??
                "_category_title_",
            style: const TextStyle(
              color: Color(0xfff1e4d4),
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        backgroundColor: const Color(0xff151e2c),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              for (final category in categories) ...[
                InteractiveButton(
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoutes.getTrainingRoutePath(category.route),
                  ),
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(buttonPadding),
                  brightness: Brightness.light,
                  child: FittedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          category.title ?? "_category_title_",
                          style: TextStyle(
                            color: const Color(0xfff1e4d4),
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.italic,
                            fontSize: MediaQuery.of(context).size.height,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
