import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  void reset() => setState(() => clickCounter = 0);
  void increment() => setState(() => clickCounter++);
  void decrement() => setState(() => clickCounter > 0 ? clickCounter-- : null);

  String get clickCounterText => clickCounter > 0 ? "s" : "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(child: Text("Contador")),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: () => reset())
          ]),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text("$clickCounter",
            style: TextStyle(fontSize: 160, fontWeight: FontWeight.w100)),
        Text("Click$clickCounterText", style: TextStyle(fontSize: 25))
      ])),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomButton(icon: Icons.add, onPressed: increment),
          CustomButton(icon: Icons.remove, onPressed: decrement)
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: StadiumBorder(),
        enableFeedback: true,
        elevation: 10,
        onPressed: onPressed,
        child: Icon(icon));
  }
}
