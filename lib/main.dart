import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yx_state_flutter/yx_state_flutter.dart';

import 'services/services.dart';
import 'home_screen.dart';

void main() {
  GetIt.I.registerSingleton<SettingsController>(SettingsController());
  GetIt.I.registerSingleton<CounterController>(CounterController(0));

  return runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settings = GetIt.I<SettingsController>();
    return StateBuilder<AppSettings>(
      stateReadable: settings,
      builder: (context, state, _) {
        return MaterialApp(
          title: 'Flutter yx_state Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: state.theme,
          home: const HomeScreen(title: 'Flutter Demo yx_state Home Page'),
        );
      },
    );
  }
}
