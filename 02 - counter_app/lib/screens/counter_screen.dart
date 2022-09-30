

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  
  const CounterScreen({ Key? key }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();

}

class _CounterScreenState extends State<CounterScreen> {

  /* PARA PODER CAMBIAR EL VALOR DEL ESTADO DE LA VARIABLE COUNTER 
  HAY QUE PONERLO FUERA DEL BUILD PARA VOLVERLO UNA PROPIEDAD*/
  int counter = 0;

  void increase(){
    counter++;
    setState(() {});
  }
  
  void decrease(){
    counter--;
    setState(() {});
  }
  
  void reset(){
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const fontSize30 = TextStyle( fontSize: 30 );

    return Scaffold(

      appBar: AppBar(
        title: const Text('Counter Screen'), 
        elevation: 10,
      ),


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            const Text('Numero de Clicks', style: fontSize30),
            Text('$counter', style: fontSize30)
          ],

        ),

      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton:  CustomFloatingActions(
        increaseFn: increase,
        decreaseFn: decrease,
        resetFn: reset,
      ),

    );

  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key, 
    required this.increaseFn, 
    required this.decreaseFn, 
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [

        FloatingActionButton(

          child: const Icon(Icons.exposure_plus_1_outlined),

          // onPressed: () => setState(() => counter++),
          onPressed: () => increaseFn(),

        ),

        FloatingActionButton(

          child: const Icon(Icons.exposure_zero_outlined),

          // onPressed: () => setState(() => counter = 0),
          onPressed: () => resetFn(),

        ),

        FloatingActionButton(

          child: const Icon(Icons.exposure_minus_1_outlined),

          // setState AVISA AL FRAMEWORK QUE DEBE REDIBUJAR PORQUE EL STATE CAMBIO //
          // onPressed: () => setState(() => counter--),
          onPressed: () => decreaseFn(),

        ),

      ],

    );
  }
}