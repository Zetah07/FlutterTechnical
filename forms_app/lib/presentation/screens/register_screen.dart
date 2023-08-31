import 'package:flutter/material.dart';
import 'package:forms_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: const _RegisterView(),
    );
  }

}


class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children:  [

              FlutterLogo(size: 100.0),

              _RegisterForm(),
              
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}


class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String username = '';
String email = '';
String password = '';


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextField(
            label: 'Nombre de Usuario',
            hint: 'Ingrese su nombre de usuario',
            errorMessage: 'El nombre de usuario es requerido',
            onChanged: (value) => username = value,
            validator: (value){


              RegExp regExp = RegExp(r'^[a-zA-Z0-9]+$');

              if (value == null || value.isEmpty) {
                return 'El nombre de usuario es requerido';
              }
              if (value.trim().length < 6) {
                return 'El nombre de usuario debe tener al menos 6 caracteres';
              }
              if (value.trim().length > 15) {
                return 'El nombre de usuario no debe tener más de 15 caracteres';
              }
              if(value.trim().isEmpty) {
                return 'Campo obligatorio';
              }
              if (value.contains(' ')) {
                return 'El nombre de usuario no debe contener espacios';
              }
              if (!regExp.hasMatch(value)) {
                return 'El nombre de usuario no debe contener caracteres especiales';
              }

              return null;
            },
          ),

          const SizedBox(height: 20.0),

          CustomTextField(
            label: 'Correo Electrónico',
            hint: 'Ingrese su correo electrónico',
            errorMessage: 'El correo electrónico es requerido',
            onChanged: (value) => email = value,
            validator: (value){


              RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

              if (value == null || value.isEmpty) {
                return 'El correo electrónico es requerido';
              }
              if (!regExp.hasMatch(value)) {
                return 'Ingrese un correo electrónico válido';
              }
              if(value.trim().isEmpty) {
                return 'Campo obligatorio';
              }

              return null;
            },
          ),

          const SizedBox(height: 20.0),

          CustomTextField(
            label: 'Contraseña',
            hint: 'Ingrese su contraseña',
            obscureText: true,
            errorMessage: 'La contraseña es requerida',
            onChanged: (value) => password = value,
            validator: (value){
            
              if (value == null || value.isEmpty) {
                return 'La contraseña es requerida';
              }
              if (value.trim().length < 6) {
                return 'La contraseña debe tener al menos 6 caracteres';
              }
              if (value.trim().length > 15) {
                return 'La contraseña no debe tener más de 15 caracteres';
              }
              if(value.trim().isEmpty) {
                return 'Campo obligatorio';
              }
              if (value.contains(' ')) {
                return 'La contraseña no debe contener espacios';
              }
              if (!value.contains(RegExp(r'[0-9]'))) {
                return 'La contraseña debe contener al menos un número';
              }
              if (!value.contains(RegExp(r'[A-Z]'))) {
                return 'La contraseña debe contener al menos una mayúscula';
              }
              if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                return 'La contraseña debe contener al menos un caracter especial';
              }

              return null;
            },
          ),

          const SizedBox(height: 20.0),

          FilledButton.tonalIcon(
            onPressed:(){
              
              final isValid = _formKey.currentState!.validate();
              if (isValid) {
                print('Username: $username');
                print('Email: $email');
                print('Password: $password');
              }
            } , 
            icon: const Icon(Icons.login),
            label: const Text('Register')
          ),
        ]
      ),
    );
  }
}