import 'dart:convert';

import 'package:angel_proyect/src/models/localidades_models.dart';
import 'package:angel_proyect/src/models/reporte_model.dart';
import 'package:angel_proyect/src/models/usuario_model.dart';
import 'package:angel_proyect/src/utils/prefs_utils.dart';
import 'package:http/http.dart' as http;



class Api {
  static const url = 'https://r-angel.herokuapp.com';

  static Future<dynamic> _get(String url) async {
    print('Iniciando petición GET $url');
    try {

      final response = await http.get(url);
      print('Respuesta -->${response.statusCode}');
      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        return body;
      } else {
        return null;
      }
    } catch (ex) {
      print('error get =>$ex');
      return null;
    }
  }

  /// Realiza una petición de tipo [post] al servicdor para lo cual se requiere
  /// la [url] de adonde se realizara el envio de información 
  /// * `envio`: es la información que se enviara para ser transformada en json
  /// * `nameMetodo`: funciona para identificar el metodo que realizo la petición de tal 
  /// manera que se pueda saver su resultado
  static Future<List<dynamic>> _post(String url, Map<String, dynamic> envio, String nameMetodo) async {
    try {
      final data = jsonEncode(envio);
      final result = await http.post(
        url,
        body: data,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
      
      print('--------------Respuesta $nameMetodo ---------------\n');
      final decodeData = json.decode(result.body);
      print("Result =>>$decodeData.");
      print("statusCode-->${result.statusCode}");
      print('---------------------------------------------------\n');
      final listResult = [result.statusCode == 201, decodeData];
      return listResult;
    } catch (e) {
      print('--------------Respuesta $nameMetodo ---------------\n');
      print(e);
      print('---------------------------------------------------\n');
      return [false,'Error en $nameMetodo'];
    }
  }


  static Future<List<dynamic>> _put(String url, Map<String, dynamic> envio, String nameMetodo) async {
    try {
      final data = jsonEncode(envio);
      final result = await http.put(
        url,
        body: data,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
      
      print('--------------Respuesta $nameMetodo ---------------\n');
      final decodeData = json.decode(result.body);
      print("Result =>>$decodeData.");
      print("statusCode-->${result.statusCode}");
      print('---------------------------------------------------\n');
      final listResult = [result.statusCode == 200, decodeData];
      return listResult;
    } catch (e) {
      print('--------------Respuesta $nameMetodo ---------------\n');
      print(e);
      print('---------------------------------------------------\n');
      return [false,'Error en $nameMetodo'];
    }
  }

  Future<bool> addUsuario(String nameUSer,String password) async {
    final user = Usuario(nombreUsuario: nameUSer, usuarioContrasea: password);
    final response = await _post(url+'/usuario', user.toJson(),'addUser');
    return response[0];
  }

  Future<bool> login(String user,pass) async{
    final response = await _put(url+'/login', {"nombreUsuario":user,"contraseña":pass}, 'login');
    print('Resultado--->${response[0]}');
    if (response[0]) {
      final prefs = new PrefsAp();
      await prefs.initPrefs();
      prefs.user = usuarioToJson(Usuario.fromJson(response[1]['objUsuario'][0]));
      // print('Datos-->'+prefs.user);
    }
    return response[0];
  }

  Future<bool> addReport(Reporte r) async{
    final response = await _post(url+'/reporte', r.toJson(), 'addReporte');
    return response[0];
  }

  Future<List<Municipio>> getLocalidades() async{
    final Localidades response = localidadesFromJson(await _get(url+'/getMunicipios'));
    return response.municipios;
  }

}
