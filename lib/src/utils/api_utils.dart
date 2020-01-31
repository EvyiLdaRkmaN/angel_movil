import 'dart:convert';

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

/*   Future<List<Cursos>> getCursos() async {
    final response = await _get('$url/cursos');
    return response != null ? cursosFromJson(response):null;
  }

  Future<List<Publicaciones>> getPublicaciones() async {
    final response = await _get('$url/publicaciones');
    return response != null ? publicacionesFromJson(response):null;
  }
  
  Future<bool> addDenuncia(Denuncia d) async {
    final respone = await _post(url+'/denuncias/crear', d.toJson(), 'Crear denuncia');
    return respone[0];
  }

  Future<bool> addSolicitud(Solicitud s) async {
    final respone = await _post(url+'/solicitudes/crear', s.toJson(), 'Crear solicitud');
    return respone[0];
  }

  Future<bool> addPublicacion(CrearPublicacion p) async {
    final respone = await _post(url+'/publicaciones/crear', p.toJson(), 'Crear addPublicacion');
    return respone[0];
  }

  Future<bool> login(Login l) async {
    final respone = await _post(url+'/auth/login', l.toJson(), 'Crear login');
    if (respone[0]) {
      final prefs = new PrefsAp();
      await prefs.initPrefs();
      prefs.user = usuarioToJson(Usuario.fromJson(respone[1]));
      print('Datos-->'+prefs.user);
    }
    return respone[0];
  } */

}
