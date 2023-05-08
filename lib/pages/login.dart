import 'package:flutter/material.dart';
import 'package:funciona/pages/qr.page.dart';
import 'package:qr_flutter/qr_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 0.0, bottom: 120.0),
                child: Text(
                  'Emprestaí,\n    Mauá!',
                  style: TextStyle(fontSize: 48.0),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, informe o login';
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onSaved: (value) => _username = value,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16.0),
                    labelText: 'Login',
                    labelStyle: TextStyle(fontSize: 20.0)),
              ),
              TextFormField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, informe a senha';
                  }
                  return null;
                },
                onSaved: (value) => _password = value,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 16.0, top: 16.0),
                    labelText: 'Senha',
                    labelStyle: TextStyle(fontSize: 20.0)),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState!.save();
                      print('Login: $_username\nSenha: $_password');
                      // Implementar a lógica de login aqui
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QRPage()),
                      );
                    }
                  },
                  child: Text('Entrar', style: TextStyle(fontSize: 22.5)),
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(200, 50)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
