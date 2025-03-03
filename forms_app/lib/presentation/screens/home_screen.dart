import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        children: [
          ListTile(
            title: Text('/'),
            subtitle: Text("Gestor de estado simple"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            title: Text('Cubits'),
            subtitle: Text("Gestor de estado simple"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: Text('BLoC'),
            subtitle: Text("Gestor de estado simple"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => context.push('/blocs'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Divider(),
          ),
          ListTile(
            title: Text('Nuevo Usuario'),
            subtitle: Text("Manejo de formularios"),
            trailing: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}
