import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menu.dart';

class Listview2Screen extends StatefulWidget {
  const Listview2Screen({Key? key}) : super(key: key);

  @override
  _Listview2ScreenState createState() => _Listview2ScreenState();
}

class _Listview2ScreenState extends State<Listview2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        backgroundColor: Colors.indigo,
      ),
      backgroundColor: Colors.cyan,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _crearInput("CORREO ELECTRONICO"),
              SizedBox(height: 30),
              _crearInput("CONTRASEÑA", esPassword: true),
              SizedBox(height: 30),
              _crearInput("NOMBRE COMPLETO"),
              SizedBox(height: 30),
              _crearInput("TELÉFONO"),
              SizedBox(height: 30),
              _crearInput("NOMBRE DE LA MASCOTA"),
              SizedBox(height: 30),
              _botonCrearCuenta(), // Aquí ya puedes acceder al context directamente
            ],
          ),
        ),
      ),
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
            fillColor: Colors.white.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            hintText: label,
            hintStyle: TextStyle(color: Colors.white70),
          ),
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Listview3Screen()),
            );
          },
          child: Text("CREAR CUENTA", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

