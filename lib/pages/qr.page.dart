import 'package:flutter/material.dart';
import 'package:funciona/pages/container.dart';
import 'package:funciona/pages/login.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
  LoginPage teste = new LoginPage();
  final String data;
  final String login;

  QRPage({required this.login}) : data = login;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Código QR"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              "Código gerado com o texto:\n $data",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            QrImage(
              data: data,
              gapless: true,
              size: 250,
              errorCorrectionLevel: QrErrorCorrectLevel.H,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContainerPage(
                              login: login,
                            )),
                  );
                },
                child: Text('Container Page', style: TextStyle(fontSize: 22.5)),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                ))
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
