import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mymovies/src/models/movie.dart';

class CardSwiper extends StatelessWidget {
  
  // const CardSwiper({Key key}) : super(key: key);
  
  final List<Movie> movies;

  CardSwiper({ @required this.movies});

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
      layout: SwiperLayout.STACK,
      itemWidth: _screenSize.width * 0.85,
      itemHeight: _screenSize.height * 0.6,
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(borderRadius: BorderRadius.circular(20.0),
         child: FadeInImage(
           image: NetworkImage( movies[index].getPosterImg()),
           placeholder: AssetImage('assets/img/no-image.jpg'),
           fit: BoxFit.cover
          )
         );
      },
      itemCount: movies.length,
      ),
    );
  }
}