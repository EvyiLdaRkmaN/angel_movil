import 'package:shared_preferences/shared_preferences.dart';

class PrefsAp {
  
  /// Permite crear una sola instancia de esta clase para lo cual
  /// cuando un usuario realiza lo siguiente
  /**
   *     PrefsAp pref = new PrefsAp();
   */
  /// se manda a llamar esta linea. 
  static final PrefsAp _instancia = PrefsAp._internal();

  factory PrefsAp(){
    return _instancia;
  }

  PrefsAp._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del genero
  String get user => _prefs.getString('user') ?? '';

  set user (String value) =>_prefs.setString('user', value);
  
  // GET y SET del photo

  void cleanPrefs(){
    _prefs.setString('user', '');
  }
}