import 'package:flutter/material.dart';
import 'package:mymovies/src/models/movie.dart';
import 'package:mymovies/src/providers/movie_provider.dart';

class DataSearch extends SearchDelegate{

  final movies = ['Spiderman','Batman','Ironman'];

  final recentMovies = ['Capitan America','Spiderman'];

  final movieProviders = new MoviesProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Acciones de nuestro AppBar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del AppBar
     return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Container();
  }

  // @override
  // Widget buildSuggestions(BuildContext context) {
  //   // Sugerencias que aparecen cuando la persona escribe

  // final SuggestList = ( query.isEmpty) ? recentMovies : movies.where((p) => p.toLowerCase().startsWith(query.toLowerCase())).toList();

  //  return ListView.builder(
  //     itemCount: recentMovies.length,  
  //     itemBuilder: (context, i){
  //       return ListTile(
  //         leading:  Icon(Icons.movie),
  //         title: Text(recentMovies[i]),
  //         onTap: (){},
  //       );
  //     }
  //   );

  // }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escribe
    if(query.isEmpty){
      return Container();
    }
    return FutureBuilder(
      future: movieProviders.searchMovie(query),
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {

        if(snapshot.hasData){

          final movies = snapshot.data;
          
          return ListView(
            children: movies.map((movie){
              return ListTile(
                leading: FadeInImage(
                  image: NetworkImage(movie.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'), 
                  width: 50.0,
                  fit: BoxFit.contain,
                ),
                title: Text(movie.title),
                subtitle: Text(movie.originalTitle),
                onTap: (){
                  close(context, null);
                  movie.uniqueId = '';
                  Navigator.pushNamed(context, 'detail', arguments: movie);
                },
              );
            }).toList()
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    ); 
  }



}