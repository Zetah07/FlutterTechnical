import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/screens/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const BlocCounterView(),
    );
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({
    super.key,
  });

  void _incrementCounter( BuildContext context, [int value = 1] ) {
    context.read<CounterBloc>().add(IncrementCounter(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: context.select((CounterBloc counterBloc) => Text('Counter Value: ${counterBloc.state.transactionCount}')),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () => {
                context.read<CounterBloc>().add(CounterReset()),
              },
            ),
          ],
        ),
        body: Center(
          child: context.select(
            (CounterBloc counterBloc) =>
                Text('Counter Value: ${counterBloc.state.counterValue}'),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: '1',
              child: const Text('+3'),
              onPressed: () => {
                _incrementCounter(context, 3)
              },
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: '2',
              child: const Text('+2'),
              onPressed: () => {
                _incrementCounter(context, 2)
              },
            ),
            const SizedBox(height: 10),
            FloatingActionButton(
              heroTag: '3',
              child: const Text('+1'),
              onPressed: () => {
                _incrementCounter(context)
              },
            ),
          ],
        ));
  }
}
