import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitCounterScreenScreen extends StatelessWidget {
  const CubitCounterScreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: _CubitCounterView(),
    );
  }
}

class _CubitCounterView extends StatelessWidget {
  void incrementCounterBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increment(value);
  }

  @override
  Widget build(BuildContext context) {
    //  por dejar global esta linea de codigo todo el widget se va a redibujar cuando cambie el estado
    final counterState = context.watch<CounterCubit>().state;
    // con la libreria equatable  se resulve el por si solo determina si cambio y sino lo mantiene

    return Scaffold(
      appBar: AppBar(
        // title: Text('Cubit Counter ${counterState.transactionCounter}'),
        title: context.select(
          (CounterCubit cubit) => Text('Cubit Counter ${cubit.state.counter}'),
        ),

        // con esto es solo para estar pendiendite de algo en especifico
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterCubit>().reset();
            },
            icon: const Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          // que solo se recontruya cuando cambie el counter
          // buildWhen: (previous, current) => current.counter != previous.counter,
          builder: (context, state) {
            return Text('Cubit Counter ${state.counter}');
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            child: const Text('+1'),
            onPressed: () => incrementCounterBy(context),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            child: const Text('+2'),
            onPressed: () => incrementCounterBy(context, 2),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            child: const Text('+3'),
            onPressed: () => incrementCounterBy(context, 3),
          ),
        ],
      ),
    );
  }
}
