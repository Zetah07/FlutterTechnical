part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}


class IncrementCounter extends CounterEvent {
  final int value;
  const IncrementCounter(this.value);
}