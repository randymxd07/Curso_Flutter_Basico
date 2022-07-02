import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {}, 
          )
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
      
          children: [
      
            // TARJETAS PRINCIPALES //
            CardSwiper(),
      
            // SLIDER DE PELICULAS //
            MovieSlider(),
      
          ],
      
        ),
        
      )

    );

  }
  
}