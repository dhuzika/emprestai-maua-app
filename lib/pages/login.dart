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
  String? get username => _username;
  String? _password;

  double _getFontSize(BuildContext context) {
    // Obter o tamanho da tela do dispositivo
    final Size screenSize = MediaQuery.of(context).size;

    // Calcular o tamanho da fonte com base no tamanho da tela
    return screenSize.width * 0.1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 0, bottom: 120.0),
                      child: Text(
                        'Emprestaí,\n    Mauá!',
                        style: TextStyle(fontSize: _getFontSize(context)),
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
                      style: TextStyle(fontSize: _getFontSize(context)),
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
                      style: TextStyle(fontSize: _getFontSize(context)),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 16.0, top: 16.0),
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
                              MaterialPageRoute(
                                  builder: (context) =>
                                      QRPage(login: _username!)),
                            );
                          }
                        },
                        child: Text('Entrar',
                            style: TextStyle(fontSize: _getFontSize(context))),
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
