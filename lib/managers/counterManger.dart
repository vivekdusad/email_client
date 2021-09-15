import 'package:rxdart/rxdart.dart';

class CounterManger {
  BehaviorSubject<int> _counter = BehaviorSubject<int>.seeded(0);
  Stream<int> get counter$ => _counter.stream;
  int get _counterTracker => 0;

  void increment() {
    _counter.add(_counterTracker + 1);
  }

  void decremnt() {
    _counter.add(_counterTracker - 1);
  }
}
