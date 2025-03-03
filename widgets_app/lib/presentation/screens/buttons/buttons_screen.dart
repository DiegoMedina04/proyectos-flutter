import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonScreen extends StatelessWidget {
  static const String name = 'button_screen';
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter + Material 3 ")),
      body: _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("Elevated ")),
            ElevatedButton(
                onPressed: null, child: const Text("Elevated Disable")),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_outlined),
              label: Text("Elevated Icon"),
            ),
            FilledButton(onPressed: () {}, child: Text("Fill")),
            FilledButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_outlined),
                label: Text("Fill Icon")),
            OutlinedButton(onPressed: () {}, child: Text("Outline")),
            OutlinedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.access_alarm_outlined),
                label: Text("Outline Icon")),
            TextButton(onPressed: () {}, child: Text("Text Button")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.account_box_outlined),
                label: Text("Text Icon")),
            CustomButton(),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.app_registration_rounded,
                  color: Colors.indigo,
                )),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.app_registration_rounded,
              ),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
                iconColor: WidgetStatePropertyAll(Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text("Hola mundo", style: TextStyle(color: Colors.white))),
        ),
      ),
    );
  }
}
