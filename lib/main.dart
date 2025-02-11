import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:veterinaria/service.dart';
import 'crearCuenta.dart';
import 'menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            // Fondo de pantalla
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/fondo_app_vet.png"),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Contenido encima del fondo
            Column(
              children: [
                SizedBox(height: 50),
                Logo(texto1: "Clínica", texto2: "veterinaria"),
                SizedBox(height: 30),
                LogoConImagen(imagenPath: "assets/iguana.png", texto: "EL PALMERAL"),
                Spacer(),
                FormularioPage(),
                SizedBox(height: 50),
              ],

            ),
          ],
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  final String texto1;
  final String texto2;

  const Logo({super.key, required this.texto1, required this.texto2});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: texto1 + " ",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: texto2,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class LogoConImagen extends StatelessWidget {
  final String imagenPath;
  final String texto;

  const LogoConImagen({super.key, required this.imagenPath, required this.texto});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido
      crossAxisAlignment: CrossAxisAlignment.center, // Alinea verticalmente
      children: [
        Image.asset(
          imagenPath,
          width: 60, // Ajusta el tamaño de la imagen
          height: 60, // Ajusta la altura
        ),
        SizedBox(width: 10), // Espacio entre imagen y texto
        Text(
          texto,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class FormularioPage extends StatefulWidget {
  const FormularioPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FormularioPageState();
  }
}

class _FormularioPageState extends State {
  String usuario = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _crearInput("USUARIO"),
        SizedBox(height: 10),
        _crearInput("CONTRASEÑA", esPassword: true),
        SizedBox(height: 30),
        _filaBotones(),
        SizedBox(height: 30),
        _botonCrearCuenta(),
      ],
    );
  }

  Widget _crearInput(String label, {bool esPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: 300,
        child: TextField(
          obscureText: esPassword,
          obscuringCharacter: '*',
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            hintText: label,
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (value) {
            if (label == "USUARIO") {
              usuario = value;
            } else if (label == "CONTRASEÑA") {
              _password = value;
            }
          },
        ),
      ),
    );
  }


  Widget _filaBotones() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _botonGoogleMaps(),
          SizedBox(width: 10),
          _botonEntrar(),
        ],
      ),
    );
  }

  Widget _botonEntrar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: 135,
        height: 45,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),
            )
          ),
          onPressed: () async {
            final authService = AuthService(); // Creo instancia de AuthService

            // Llamo al metodo login
            String? errorMessage = await authService.login(usuario, _password);

            if (errorMessage == null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Listview3Screen()),
              );
            } else {
              // Error: Mostrar mensaje en pantalla
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Text("ENTRAR", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _botonCrearCuenta() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: 300,
        height: 45,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),
            )
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Listview2Screen()),
            );
          },
          child: Text("CREA TU CUENTA", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }

  Widget _botonGoogleMaps() {
    final Uri url = Uri.parse("https://maps.app.goo.gl/B9a1AGxSiUcD1U4J7"); // Reemplaza con tu enlace real

    Future<void> _abrirGoogleMaps() async {
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw "No se pudo abrir el enlace";
      }
    }

    return SizedBox(
      width: 145,
      height: 45,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.white),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        onPressed: _abrirGoogleMaps,
        child: Image.asset(
          "assets/google.png",
          width: 30,
          height: 30,
        ),
      ),
    );
  }
}