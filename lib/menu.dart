import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listview3Screen extends StatelessWidget{
  final options=const ['SERVICIO TELEFÓNICO', 'RESERVAR UNA CITA PARA CONSULTA', 'VER CARTILLA DE VACUNACIÓN'];

  const Listview3Screen({Key? key}): super(key:key);

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index)=> ListTile(
          title: Text(options[index]),
          trailing: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.indigo
          ),
          onTap: (){},
        ),
        separatorBuilder: (_, __)=> const Divider(),
      ),
    );
  }
}