import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';

class BlocCounterScreenScreen extends StatelessWidget {
  const BlocCounterScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => CounterBloc(), child: BlocCounterView());
  }
}

class BlocCounterView extends StatelessWidget {
  const BlocCounterView({super.key});

  void increadeCounterBy(BuildContext context, [int value = 1]) {
    // con el add disparo el evento
    context.read<CounterBloc>().add(CounterIncreased(value));
  }

  @override
  Widget build(BuildContext context) {
    final state = context.select((CounterBloc bloc) => bloc.state);
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc Counter ${state.transactionCounter}'),
        actions: [
          IconButton(
            onPressed: () => context.read<CounterBloc>().add(CounterReset()),
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: Text('Bloc Counter ${state.counter}'),
        // context.select(
        // (CounterBloc bloc) => Text('Bloc Counter ${bloc.state.counter}'),
        // ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+1'),
            onPressed: () => increadeCounterBy(context),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => increadeCounterBy(context, 2),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () => increadeCounterBy(context, 3),
          ),
        ],
      ),
    );
  }
}
