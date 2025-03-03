import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Progress Indicators")),
        body: _ProgressView());
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        SizedBox(height: 30),
        Text('Cirular Porgress Indicators'),
        SizedBox(height: 10),
        CircularProgressIndicator(
            strokeWidth: 2, backgroundColor: Colors.black45),
        SizedBox(height: 20),
        Text(' Circular y Linear controlado'),
        SizedBox(height: 10),
        _ControlledProgressIndicator()
      ],
    ));
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(
                Duration(milliseconds: 300), (value) => (value * 2) / 100)
            .takeWhile((element) => element < 100),
        //takeWhile hasta que sea menos a 100
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                      value: progressValue, backgroundColor: Colors.black12),
                  SizedBox(width: 20),
                  Expanded(child: LinearProgressIndicator(value: progressValue))
                ],
              ));
        });
  }
}
