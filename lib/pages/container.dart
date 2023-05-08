import 'package:flutter/material.dart';

class ContainerPage extends StatefulWidget {
  @override
  _ContainerPageState createState() => _ContainerPageState();
}

class _ContainerPageState extends State<ContainerPage> {
  bool _notebookEmprestado = false;

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
    );
  }
}
