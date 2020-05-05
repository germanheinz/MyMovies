import 'package:flutter/material.dart';
import 'package:mymovies/src/models/movie.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Movie> movies;

  MovieHorizontal({@required this.movies});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.2,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.3),
        children: _cards(context),
        ), 
    );
  }
  List<Widget> _cards(BuildContext context){
    return movies.map((movies) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: FadeInImage(placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage(movies.getPosterImg()),
              fit: BoxFit.cover,
              height: 100.0,
              ),
            ),
            SizedBox(height: 1.5),
            Text(
              movies.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}