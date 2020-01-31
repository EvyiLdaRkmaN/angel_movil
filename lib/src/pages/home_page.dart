import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  final colorBase = 0xFF33FF9B;
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
      RaisedButton(
        child: Text('Crear reporte'),
        onPressed: ()=>Navigator.pushNamed(context, 'sector'),
        color: Color(colorBase),
      ),
      RaisedButton(
        child: Text('Sistema de mensajeria'),
        onPressed: ()=>Navigator.pushNamed(context, 'setReport'),
        color: Color(colorBase),
      )
    ];
  }

  
}