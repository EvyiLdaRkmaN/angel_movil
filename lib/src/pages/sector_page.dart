import 'package:flutter/material.dart';


class SectorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('INTEGRA FILO MAYOR S.C.'),
            Text('Sistema de reporte movil'),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _createButtons(context),
        ),
      ),
    );
  }

  List<Widget> _createButtons(BuildContext context){
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
              child: Text('Eduación'),

            ),
          RaisedButton(
              child: Text('Salud'),
            ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
              child: Text('Producción'),
            ),
          RaisedButton(
              child: Text('Caminos'),
            ),
        ],
      )
    ];
  }
}