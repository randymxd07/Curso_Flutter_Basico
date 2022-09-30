

// IMPORTO EL PAQUETE DE MATERIAL DART //
import 'package:flutter/material.dart';

// CREO LA CLASE HOME SCREEN //
class HomeScreen extends StatelessWidget {
  
  // CREO LA LLAVE DE LA CLASE HOME SCREEN //
  const HomeScreen({ Key? key }) : super(key: key);

  // PONGO EL OVERRIDE //
  @override
  Widget build(BuildContext context) {

    // DEFINO UNA CONSTANTE PARA PONER LOS TEXTOS CON UN TAMAñO DE 30PX //
    const fontSize30 = TextStyle( fontSize: 30 );

    int counter = 10;

    return Scaffold(

      // APPBAR DE ARRIBA //
      appBar: AppBar(
        title: const Text('Home Screen'), // TITULO DEL APPBAR //
        elevation: 10, // ESTO PONE UNA SOMBRA EN EL APPBAR //
      ),

      // backgroundColor: Colors.cyan, // PARA CAMBIAR EL COLOR DEL FONDO DEL Scaffold //

      // BODY DEL Scaffold //
      body: Center( // CENTER PARA CENTRAR EL CONTENIDO //

        child: Column( // COLUMN PARA CREAR VARIOS ELEMENTOS UNO ABAJO DE OTRO //

          // PARA ALINEAR LOS ELEMENTOS DE LA COLUMNA EN EL CENTRO //
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text('Numero de Clicks', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],

        ),

      ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButton(

        child: const Icon(Icons.add),

        onPressed: () {

          counter++;
          print('Hola mundo!');

        },

      ),

    );

  }
  
}