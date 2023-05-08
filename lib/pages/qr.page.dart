import 'package:flutter/material.dart';
import 'package:funciona/pages/container.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
  final String data = "22.00506-4";

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
                    MaterialPageRoute(builder: (context) => ContainerPage()),
                  );
                },
                child: Text('Container Page', style: TextStyle(fontSize: 22.5)),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(Size(200, 50)),
                ))
          ],
        ),
      ),
    );
  }
}
