import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yx_state_flutter/yx_state_flutter.dart';

import 'services/services.dart';

import 'home_page.dart';

void main() {
  final themeController = ThemeController();
  GetIt.I.registerSingleton<ThemeController>(themeController);
  GetIt.I.registerSingleton<CounterController>(CounterController(0));

  return runApp(YxStateApp(theme: themeController));
}

class YxStateApp extends StatelessWidget {
  final ThemeController theme;

  const YxStateApp({super.key, required this.theme});
  // final CounterController cc = GetIt.I<CounterController>(
  @override
  Widget build(BuildContext context) {
    return StateBuilder<ThemeMode>(
      stateReadable: theme,
      builder: (context, state, _) => MaterialApp(
        title: 'Flutter yx_state Demo',
        debugShowCheckedModeBanner: false,
        themeMode: state,
        theme: ThemeData(colorSchemeSeed: Colors.blue),
        darkTheme: ThemeData.dark(),
        home: const HomePage(title: 'Flutter Demo yx_state Home Page'),
      ),
    );
  }
}
