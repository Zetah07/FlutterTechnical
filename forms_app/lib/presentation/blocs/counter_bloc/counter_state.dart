part of 'counter_bloc.dart';

class CounterState extends Equatable {

  final int counterValue;
  final int transactionCount;

  const CounterState({
    this.counterValue = 10,
    this.transactionCount = 0,
  });
  
  CounterState copyWith({
    int? counterValue, int? transactionCount
  }) => CounterState(
      counterValue: counterValue ?? this.counterValue,
      transactionCount: transactionCount ?? this.transactionCount,
    );

  
  @override
  List<Object> get props => [ counterValue, transactionCount ];

}
