import "package:flutter/material.dart";

import "package:morse_learn/app.dart";
import "package:morse_learn/helpers/helpers.dart";
import "package:morse_learn/screens/screens.dart";

class AppStartup extends StatefulWidget {
  const AppStartup({super.key});

  @override
  State<AppStartup> createState() => _AppStartupState();
}

class _AppStartupState extends State<AppStartup> {
  bool loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _onAppStart(),
    );
  }

  Future<void> _onAppStart() async {
    await initProviders();

    await Future.delayed(const Duration(milliseconds: 600));

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading ? const SplashScreen() : const App();
  }
}
