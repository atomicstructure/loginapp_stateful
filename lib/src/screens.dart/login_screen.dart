import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

mixin ValidationMixin {
  String? validateEmail(value) {
    if (value!.isEmpty || !value.contains('@, .')) {
      return 'Please enter your email correctly.';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value!.isEmpty || value.length < 8) {
      return 'Please make sure your password is at least 8 characters long.';
    }
    return null;
  }
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              emailField(),
              const SizedBox(
                height: 10.0,
              ),
              passwordField(),
              const SizedBox(
                height: 5.0,
              ),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        labelText: 'Email',
        hintText: 'Email address here...',
      ),
      validator: validateEmail,
      onSaved: (newValue) {
        email = newValue!;
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        labelText: 'Password',
        hintText: 'Input password here...',
      ),
      validator: validatePassword,
      onSaved: (newValue) {
        password = newValue!;
      },
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.purple[300]),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          print('Email: $email, Password: $password');
          _formKey.currentState!.reset();
        }
      },
      child: const Text(
        'Submit',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
