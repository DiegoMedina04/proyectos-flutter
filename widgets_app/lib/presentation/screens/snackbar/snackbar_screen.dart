import 'package:flutter/material.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
                title: const Text("¿ Estas seguro?"),
                content: const Text(
                    "Id enim occaecat aliqua sint proident excepteur esse velit fugiat dolore elit aliquip nulla nisi."),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancelar")),
                  TextButton(onPressed: () {}, child: const Text("Aceptar")),
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(" Snackbar ")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                  onPressed: () {
                    showAboutDialog(context: context, children: [
                      Text("Licencias usadas"),
                    ]);
                  },
                  child: Text("Licencias usadas")),
              FilledButton(
                  onPressed: () => openDialog(context),
                  child: Text("Mostar dialogo")),
            ],
          ),
        ),
        floatingActionButton: _CustomFloatingActionButton());
  }
}

class _CustomFloatingActionButton extends StatelessWidget {
  const _CustomFloatingActionButton({super.key});
  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars(); //para limpiar el snackbar
    final snackbar = SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(
        label: 'Hola!',
        onPressed: () {
          // para que se cierrer el snackbar
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
        },
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: Text("Mostrar Snackbar"),
        icon: Icon(Icons.remove_red_eye_outlined));
  }
}
