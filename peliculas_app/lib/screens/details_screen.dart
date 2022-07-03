import 'package:flutter/material.dart';
import 'package:peliculas_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(

      body: CustomScrollView(

        slivers: [

          _CustomAppBar(),

          SliverList( // ME PERMITE PONER MIS WIDGETS DENTRO DE UN SLIVER //

            delegate: SliverChildListDelegate([ // PONGO MI LISTA DE WIDGETS //

              _PosterAndTitle(),

              _OverView(),
              _OverView(),
              _OverView(),

              CastingCards()

            ])

          )
          
        ],
      )

    );

  }
  
}

class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return SliverAppBar(

      backgroundColor: Colors.indigo,

      expandedHeight: 200,

      floating: false,

      pinned: true,

      flexibleSpace: FlexibleSpaceBar(

        centerTitle: true,

        titlePadding: const EdgeInsets.all(0),

        title: Container(

          width: double.infinity,

          alignment: Alignment.bottomCenter,

          padding: const EdgeInsets.only(bottom: 10),

          color: Colors.black12, // PARA PONER UN CONOR OSCURO TRANSPARENTE A LA IMAGEN //

          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          )

        ),

        background: const FadeInImage(

          placeholder: AssetImage('lib/assets/no-image.jpg'), 

          image: NetworkImage('https://via.placeholder.com/500x300'), /* AssetImage('lib/assets/loading.gif') */

          fit: BoxFit.cover,

        ),

      ),

    );

  }

}

class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(

      margin: const EdgeInsets.only(top: 20),

      padding: const EdgeInsets.symmetric(horizontal: 20),

      child: Row(

        children: [

          ClipRRect(

            borderRadius: BorderRadius.circular(20),

            child: const FadeInImage(
              placeholder: AssetImage('lib/assets/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
            ),

          ),

          const SizedBox(width: 20),

          Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              
              Text(
                'movie.originalTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
              ),

              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.caption)
                ],
              )

            ],

          ),

        ],

      ),

    );

  }

}

class _OverView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Container(

      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Consectetur do irure culpa cupidatat dolore officia cupidatat ad nulla voluptate sint. Elit aliqua quis occaecat nulla culpa exercitation aute adipisicing ex anim dolore qui. Lorem culpa esse laborum culpa veniam aliquip cillum excepteur est duis. Proident exercitation nisi reprehenderit ullamco ullamco eu occaecat eiusmod velit officia ipsum aute ad dolore.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),

    );

  }

}