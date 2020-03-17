import 'package:angel_proyect/src/pages/home_page.dart';
import 'package:angel_proyect/src/pages/sector_page.dart';
import 'package:angel_proyect/src/pages/setReport_page.dart';
import 'package:angel_proyect/src/utils/api_utils.dart';
import 'package:angel_proyect/src/utils/prefs_utils.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = PrefsAp();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final prefs = PrefsAp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: prefs.user.isEmpty ? '/' : 'homePage',
      routes: {
        '/': (context) => Inicio(),
        'homePage': (contex) => HomePage(),
        'sector': (context) => SectorPage(),
        'setReport': (context) => SetReportPage(),
      },
      // home: Inicio(title: 'Flutter Demo Home Page'),
    );
  }
}

class Inicio extends StatefulWidget {
  Inicio({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Iniciar sesión',
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(
                    Icons.person,
                    size: 150,
                  ),
                  inputUser(),
                  inputPassword(),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                    child: Text(
                      'Iniciar',
                      style: TextStyle(color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                    color: Colors.blue,
                    onPressed: _iniciar,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputUser() {
    return TextFormField(
      controller: _userController,
      decoration: InputDecoration(
          icon: Icon(Icons.alternate_email),
          hintText: 'nombre de usuario',
          labelText: 'Usuario'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget inputPassword() {
    return TextFormField(
      controller: _passController,
      decoration: InputDecoration(
          icon: Icon(Icons.lock),
          hintText: 'ingresa tu contraseña',
          labelText: 'Contraseña'),
      obscureText: true,
    );
  }

  void _iniciar() async {
    final user = _userController.text;
    final password = _passController.text;

    String messaje = '';
    bool response = false;

    if (user.isEmpty || password.isEmpty) {
      messaje = 'Ingrese todos los datos';
    } else {
      response = await Api().login(user, password);
      messaje = response ? '' : 'No se pudo iniciar sesión, revice sus datos';
    }

    final snackbar = SnackBar(
      content: Text(messaje),
    );

    response
        ? Navigator.pushReplacementNamed(context, 'homePage')
        : _key.currentState.showSnackBar(snackbar);
  }
}
