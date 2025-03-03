import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ui Controls")),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Trasnportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Trasnportation selectedTransportation = Trasnportation.car;
  bool wantBreakFast = false;
  bool wantLunch = false;
  bool wantDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text("Developer Mode"),
          subtitle: const Text("Controles adicionales"),
          value: isDeveloper,
          onChanged: (value) => setState(() => isDeveloper = !isDeveloper),
        ),
        ExpansionTile(
            title: Text("Transportation"),
            subtitle: Text("Viajar por $selectedTransportation"),
            children: [
              RadioListTile(
                title: const Text("By car"),
                subtitle: const Text("Viajar por carro"),
                value: Trasnportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) =>
                    setState(() => selectedTransportation = Trasnportation.car),
              ),
              RadioListTile(
                title: const Text("By plane"),
                subtitle: const Text("Viajar por avión"),
                value: Trasnportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Trasnportation.plane),
              ),
              RadioListTile(
                title: const Text("By boat"),
                subtitle: const Text("Viajar por barco"),
                value: Trasnportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Trasnportation.boat),
              ),
              RadioListTile(
                title: const Text("By submarine"),
                subtitle: const Text("Viajar por submarino"),
                value: Trasnportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Trasnportation.submarine),
              ),
            ]),
        CheckboxListTile(
          title: Text("Desayunar?"),
          value: wantBreakFast,
          onChanged: (value) => setState(() {
            wantBreakFast = !wantBreakFast;
          }),
        ),
        CheckboxListTile(
          title: Text("Almuerzo?"),
          value: wantLunch,
          onChanged: (value) => setState(() {
            wantLunch = !wantLunch;
          }),
        ),
        CheckboxListTile(
          title: Text("Cena?"),
          value: wantDinner,
          onChanged: (value) => setState(() {
            wantDinner = !wantDinner;
          }),
        ),
      ],
    );
  }
}
