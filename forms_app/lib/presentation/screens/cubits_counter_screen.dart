import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: const _CubitCounterView()
      );
  }
}




class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  @override
  Widget build(BuildContext context) {

    // final counterState = context.watch<CounterCubit>().state;

    return Scaffold(
      appBar: AppBar(
        title: context.select(( CounterCubit value ){
          return Text( 'Cubit Counter: ${value.state.transactionCount}' );
        }),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => {
              context.read<CounterCubit>().reset(),
            },
          ),
        ],
      ),

      body:  Center(
        child: BlocBuilder<CounterCubit, CounterState> (
          buildWhen: (previous, current) => previous.counterValue != current.counterValue,
          builder: (context, state) {
            return Text('Counter Value: ${state.counterValue}');
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+3'),
            onPressed: () => {
              context.read<CounterCubit>().increaseBy(3),
            },
          ),
          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => {
              context.read<CounterCubit>().increaseBy(2),
            },
          ),
          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: '3',
            child: const Text('+1'),
            onPressed: () => {
              context.read<CounterCubit>().increaseBy(1)
            },
          ),
        ],
      )
      );
  }
}