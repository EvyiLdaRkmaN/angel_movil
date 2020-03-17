import 'package:angel_proyect/src/models/localidades_models.dart';
import 'package:angel_proyect/src/models/reporte_model.dart';
import 'package:angel_proyect/src/utils/api_utils.dart';
import 'package:flutter/material.dart';


class SetReportPage extends StatefulWidget {
  @override
  _SetReportPageState createState() => _SetReportPageState();
}

class _SetReportPageState extends State<SetReportPage> {
  final colorBase = 0xFF33FF9B;
  String text= '';
  String dropdownValue  ='Prioridad';
  String dropdownValueLoca  ='Localidad';
  final _localidadControll = TextEditingController();
  final _peticionControll = TextEditingController();
  final _objetivoControll = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    text = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _key,
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
        child: FutureBuilder(
          future: Api().getLocalidades(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _createElements(snapshot.data),
                  ),
                ),
              );
            }
            return Center(child:CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  List<Widget>_createElements(List<Municipio> localidades){
    return [
      Text('Crear reporte eje '+text, style: Theme.of(context).textTheme.title,),
      SizedBox(height:10.0),
      _inputLocalidad(localidades),
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

  Widget _inputLocalidad(List<Municipio> loc){
    List<String> list = ['Localidad'];
    list.addAll(loc.map((f)=>f.nombreLocalidad).toList());
    
    return DropdownButton<String>(
      value: dropdownValueLoca ,
      items: list.map((f)=>DropdownMenuItem<String>(child: Text(f),value: f,)).toList(), 
      onChanged: (String value) {
        print('Valor drop--->$value');
        setState(() {
          dropdownValueLoca  = value;
        });
      },
      isExpanded: true,
    );
  }

  Widget _inputPeticion(){
    return TextFormField(
      controller: _peticionControll,
      decoration: InputDecoration(
        // icon: Icon(Icons.lock),
        hintText: 'Petición',
        labelText: 'Petición'
      ),
    
    );
  }

  Widget _inputObjetivo(){
    return TextFormField(
      controller: _objetivoControll,
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
      items: ['Prioridad','Alta','Baja','Normal'].map((f)=>DropdownMenuItem<String>(child: Text(f),value: f,)).toList(), 
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
      onPressed: () async{
        String mensaje = '';
        String localidad = dropdownValueLoca;
        String peticion = _peticionControll.text;
        String objetivo = _objetivoControll.text;
        String tipo     = dropdownValue;
        if (localidad.isEmpty||peticion.isEmpty||objetivo.isEmpty||tipo == 'Prioridad') {
          mensaje = 'Todos los datos son requeridos';
        }else{
          final r = Reporte(
            localidad: localidad,
            reporteObjetivo: objetivo,
            reportePeticion: peticion,
            reportePrioridad: tipo
          );
          final response = await Api().addReport(r);
          mensaje = response ? 'Registro exitoso':'Lo sentimos ocurrio un error al registrar';
          if (response) {
            _localidadControll.clear();
            _peticionControll.clear();
            _objetivoControll.clear();
            setState(() {
              dropdownValue = 'Prioridad';
              dropdownValueLoca = 'Localidad';
            });
          }
        }
        final snackbar = SnackBar(content: Text(mensaje),);
        _key.currentState.showSnackBar(snackbar);
      },
    );
  }
}