import 'package:shared_preferences/shared_preferences.dart';
import 'package:yx_state/yx_state.dart';

const _storeName = 'app_counter';

class CounterController extends StateManager<int> {
  CounterController(super.state){
    _loadSettings();
  }

  void _loadSettings() => handle((emit) async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getInt(_storeName);
    emit(saved ?? 0);
  });


  void increment() => handle((emit) async {

    final newState = state + 1;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_storeName, newState);
    emit(newState);
  });
}
