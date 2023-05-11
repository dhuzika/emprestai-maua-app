import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:funciona/pages/login.dart';
import 'package:funciona/pages/qr.page.dart';

class ContainerPage extends StatefulWidget {
  int _currentIndex = 0;

  final String login;
  final String data;

  ContainerPage({required this.login}) : data = login;

  @override
  _ContainerPageState createState() => _ContainerPageState(login: login);
}

class _ContainerPageState extends State<ContainerPage> {
  int _currentIndex = 0;
  bool _notebookEmprestado = false;

  final String login;
  final String data;

  _ContainerPageState({required this.login}) : data = login;

  void _emprestarNotebook() {
    setState(() {
      _notebookEmprestado = true;
    });
  }

  void _devolverNotebook() {
    setState(() {
      _notebookEmprestado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Equipamentos emprestados"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 16,
            ),
            Text(
              _notebookEmprestado
                  ? 'Você possui empréstimos\n             no momento'
                  : 'Você não possui empréstimos\n               no momento :)',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed:
                  _notebookEmprestado ? _devolverNotebook : _emprestarNotebook,
              child: Text(
                _notebookEmprestado
                    ? 'Devolver notebook'
                    : 'Emprestar notebook',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Home',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'QRCode',
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.computer),
              label: 'Notebooks',
              backgroundColor: Colors.blue),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => QRPage(
                        login: login,
                      )),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContainerPage(
                        login: login,
                      )),
            );
          }
        },
      ),
    );
  }
}
