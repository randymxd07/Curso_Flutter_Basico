import 'package:flutter/material.dart';
import 'package:peliculas_app/models/movie.dart';

class MovieSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MovieSlider({
    Key? key,
    required this.movies,
    this.title, 
    required this.onNextPage
  }) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();

}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = new ScrollController();

  // PARA CUANDO EL WIDGET ES CONSTRUIDO //
  @override
  void initState() {

    super.initState();

    scrollController.addListener(() {
      
      if(scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500){

        widget.onNextPage();

      }

    });

  }

  //  PARA CUANDO EL WIDGET VA A SER DESTRUIDO //
  @override
  void dispose() {



    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      height: 260,

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          if(widget.title != null)
            Padding(  
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ),

          const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => _MoviePoster( movie: widget.movies[index] )
            ),
          )

        ],

      ),

    );

  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie;

  const _MoviePoster({
    super.key, 
    required this.movie
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      width: 130,

      height: 190,

      margin: const EdgeInsets.symmetric(horizontal: 10),

      child: Column(

        children: [

          GestureDetector( // PARA USAR EL ON TAP //

            onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),

            child: ClipRRect( // PARA AGREGAR EL BORDER RADIUS //

              borderRadius: BorderRadius.circular(20),
              
              child: FadeInImage(
                placeholder: AssetImage('lib/assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
              
            ),

          ),

          const SizedBox(height: 5),

          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )

        ],

      ),

    ); 

  }

}