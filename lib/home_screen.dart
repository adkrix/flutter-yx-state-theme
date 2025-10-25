import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yx_state_flutter/yx_state_flutter.dart';
import 'services/services.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({super.key, required this.title});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final CounterController _counterController;
  late final SettingsController _themeController;

  @override
  void initState() {
    super.initState();
    _counterController = GetIt.I<CounterController>();
    _themeController = GetIt.I<SettingsController>();
  }

  @override
  void dispose() {
    _counterController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            StateBuilder<int>(
              stateReadable: _counterController,
              builder: (context, state, _) => Text(
                '$state',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            FilledButton(
              child: Text('Change theme'),
              onPressed: () {
                _themeController.toggleTheme();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _counterController.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
