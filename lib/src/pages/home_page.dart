import 'package:angel_proyect/src/models/usuario_model.dart';
import 'package:angel_proyect/src/utils/prefs_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';


class HomePage extends StatelessWidget {
  final colorBase = 0xFF33FF9B;
  final prefs = new PrefsAp();
  Usuario user ;
  @override
  Widget build(BuildContext context) {
    user = usuarioFromJson(prefs.user);
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
        onPressed: ()=>FlutterWebBrowser.openWebPage(url: "https://r-angel.herokuapp.com/chat.html?nombre=${user.nombreUsuario}&sala=asistencia", androidToolbarColor: Colors.deepPurple),
        color: Color(colorBase),
      )
    ];
  }

  
}