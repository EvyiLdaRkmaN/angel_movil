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
              onPressed: (){
                String title = 'Educación';
                Navigator.pushNamed(
                  context,
                  'setReport',
                  arguments: title
                );
              },
            ),
          RaisedButton(
              child: Text('Salud'),
              onPressed: (){
                String title = 'Salud';
                Navigator.pushNamed(
                  context,
                  'setReport',
                  arguments: title
                );
              },
            ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          RaisedButton(
              child: Text('Producción'),
              onPressed: (){
                String title = 'Producción';
                Navigator.pushNamed(
                  context,
                  'setReport',
                  arguments: title
                );
              },
            ),
          RaisedButton(
              child: Text('Caminos'),
              onPressed: (){
                String title = 'Caminos';
                Navigator.pushNamed(
                  context,
                  'setReport',
                  arguments: title
                );
              },
            ),
        ],
      )
    ];
  }
}