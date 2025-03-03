part of 'counter_bloc.dart';

sealed class CounterEvent {
  const CounterEvent();
}

class CounterIncreased extends CounterEvent {
  final int valueIncrement;

  const CounterIncreased(this.valueIncrement);
}

class CounterReset extends CounterEvent {}
