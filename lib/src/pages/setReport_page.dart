import 'package:flutter/material.dart';

import 'package:flutter_web_browser/flutter_web_browser.dart';

class SetReportPage extends StatefulWidget {
  @override
  _SetReportPageState createState() => _SetReportPageState();
}

class _SetReportPageState extends State<SetReportPage> {
  final colorBase = 0xFF33FF9B;
  String text= '';
  String dropdownValue  ='Normal';
  final _localidadControll = TextEditingController();
  @override
  Widget build(BuildContext context) {
    text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            Text('INTEGRA FILO MAYOR S.C.'),
            Text('Sistema de reporte movil'),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _createElements(),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget>_createElements(){
    return [
      Text('Crear reporte eje '+text, style: Theme.of(context).textTheme.title,),
      SizedBox(height:10.0),
      _inputLocalidad(),
      SizedBox(height:10.0),
      _inputPeticion(),
      SizedBox(height:10.0),
      _inputObjetivo(),
      SizedBox(height:10.0),
      _inputPrioridad(),
      SizedBox(height:10.0),
      _button(),
    ];
  }

  Widget _inputLocalidad(){
    return TextFormField(
      controller: _localidadControll,
      decoration: InputDecoration(
        // icon: Icon(Icons.lock),
        hintText: 'Localidad',
        labelText: 'Localidad'
      ),
    
    );
  }

  Widget _inputPeticion(){
    return TextFormField(
      controller: _localidadControll,
      decoration: InputDecoration(
        // icon: Icon(Icons.lock),
        hintText: 'Petición',
        labelText: 'Petición'
      ),
    
    );
  }

  Widget _inputObjetivo(){
    return TextFormField(
      controller: _localidadControll,
      decoration: InputDecoration(
        // icon: Icon(Icons.lock),
        hintText: 'Objetivo',
        labelText: 'Objetivo'
      ),
      maxLines: 5,
    
    );
  }

  Widget _inputPrioridad(){
    return DropdownButton<String>(
      value: dropdownValue ,
      items: ['Alta','Baja','Normal'].map((f)=>DropdownMenuItem<String>(child: Text(f),value: f,)).toList(), 
      onChanged: (String value) {
        print('Valor drop--->$value');
        setState(() {
          dropdownValue  = value;
        });
      },
      isExpanded: true,
    );
  }

  Widget _button(){
    return IconButton(
      icon: Icon(Icons.done,color: Color(colorBase),),
      iconSize: 50.0,
      onPressed: (){
        FlutterWebBrowser.openWebPage(url: "https://flutter.io/", androidToolbarColor: Colors.deepPurple);
      },
    );
  }
}