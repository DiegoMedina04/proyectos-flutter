import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickCounter = 0;

  void increment() => setState(() => clickCounter++);
  void decrement() => setState(() => clickCounter--);
  String get clickCounterText => clickCounter > 0 ? "s" : "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Contador")), actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        )
      ]),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("$clickCounter",
            style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
        Text("hola Click$clickCounterText", style: TextStyle(fontSize: 25))
      ])),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
            onPressed: () => increment(), child: Icon(Icons.add)),
        FloatingActionButton(
            onPressed: () => clickCounter > 0 ? decrement() : null,
            child: Icon(Icons.remove))
      ]),
    );
  }
}
