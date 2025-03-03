import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static final String name = "counter_screen";
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounterProvider = ref.watch(counterProvider);
    final bool darkModeProvider = ref.watch(isDarkModeProvider);
    return Scaffold(
      backgroundColor: darkModeProvider ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Center(
            child: Text("Counter Screen",
                style: Theme.of(context).textTheme.titleLarge)),
        actions: [
          IconButton(
              onPressed: () {
                ref.read(isDarkModeProvider.notifier).state = !darkModeProvider;
              },
              icon: Icon(darkModeProvider
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined))
        ],
      ),
      body: Center(
        child: Text("Valor: $clickCounterProvider"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state += 1;
            // ref.read(counterProvider).update((state) => state + 1);
          },
          child: Icon(Icons.add)),
    );
  }
}
