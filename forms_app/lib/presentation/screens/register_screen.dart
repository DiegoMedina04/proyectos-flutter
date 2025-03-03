import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('RegisterScreen')),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),

              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.read<RegisterCubit>();
    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;
    print("se dibujo!!!!");
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Nombre de usuarios',
            onFieldSubmitted: registerCubit.usernameChanged,
            errorText: username.errorMessage,
            // errorText:
            //     username.isPure || username.isValid
            //         ? null
            //         : 'El nombre es obligatorio',
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Correo electronico',
            onFieldSubmitted: (value) {
              registerCubit.emailChanged(value);
              // context.read<RegisterCubit>().emailChanged(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'El nombre es obligatorio';
              }
              // final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              // if (!emailRegExp.hasMatch(value)) {
              //   return 'El correo no es valido';
              // }
              return null;
            },
          ),
          SizedBox(height: 20),
          CustomTextFormField(
            label: 'Contraseña',
            obscureText: true,
            onFieldSubmitted: (value) {
              registerCubit.passwordChanged(value);
              // context.read<RegisterCubit>().passwordChanged(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) {
                return 'La contraseña es obligatorio';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              registerCubit.submit();
              // context.read<RegisterCubit>().submit();
            },
            icon: Icon(Icons.save),
            label: Text("Crear usuario"),
          ),
        ],
      ),
    );
  }
}
