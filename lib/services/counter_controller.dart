import 'package:yx_state/yx_state.dart';

class CounterController extends StateManager<int> {
  CounterController(super.state);

  void increment() => handle((emit) async {
    emit(state + 1);
  });
}
