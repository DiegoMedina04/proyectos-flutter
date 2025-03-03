import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counter: 5, transactionCounter: 0));

  void increment(int value) => emit(
    state.copyWith(
      counter: state.counter + value,
      transactionCounter: state.transactionCounter + 1,
    ),
  );
  void decrement(int value) => emit(
    state.copyWith(
      counter: state.counter - value,
      transactionCounter: state.transactionCounter + 1,
    ),
  );
  void reset() => emit(state.copyWith(counter: 0));
}
