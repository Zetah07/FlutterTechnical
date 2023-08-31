import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super( const CounterState( counterValue: 5 ) );

  void increaseBy ( int value ) {
    emit ( state.copyWith( counterValue: state.counterValue + value, 
      transactionCount: state.transactionCount + 1 ) );

  }

  void reset () {
    emit ( state.copyWith( counterValue: 0, transactionCount: 0 ) );
  }

}
