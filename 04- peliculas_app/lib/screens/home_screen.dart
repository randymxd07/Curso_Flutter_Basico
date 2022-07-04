import 'package:flutter/material.dart';
import 'package:peliculas_app/search/search_delegate.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final moviesProvider = Provider.of<MoviesProvider>(context/* , listen: true */); // LISTEN ES PARA QUE SE REDIBUJE POR SI HAY CAMBIOS //

    return Scaffold(

      appBar: AppBar(
        title: const Text('Peliculas'),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()), 
          )
        ],
      ),

      body: SingleChildScrollView(

        child: Column(
      
          children: [
      
            // TARJETAS PRINCIPALES //
            CardSwiper( movies: moviesProvider.onDisplayMovies ),
      
            // SLIDER DE PELICULAS //
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
      
          ],
      
        ),
        
      )

    );

  }
  
}