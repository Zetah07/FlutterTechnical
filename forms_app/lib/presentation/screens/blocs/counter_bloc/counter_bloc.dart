import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {

  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter>(_onIncrementCounter);
    on<CounterReset>(_onCounterReset);
  }



  void _onIncrementCounter ( IncrementCounter event, Emitter<CounterState> emit ){
    emit(state.copyWith(
        counterValue: state.counterValue + event.value,
        transactionCount: state.transactionCount + 1,
      ));
  }


  void _onCounterReset ( CounterReset event, Emitter<CounterState> emit ){
    emit(state.copyWith(
        counterValue: 0
      ));
  }
}