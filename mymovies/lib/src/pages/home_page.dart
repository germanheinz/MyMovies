import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mymovies/src/pages/widgets/card_swiper_widget.dart';
import 'package:mymovies/src/providers/movie_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in threatres'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: Container(
        child: Column(
        children: <Widget>[
          _swiperTarjetas()

        ],
        ),
      )
    );
  }
  Widget _swiperTarjetas(){
    final moviesProvider = new MoviesProvider();
    moviesProvider.getInTheatres();
    return CardSwiper(
      movies: [1,2,3,4,5,6],
    );
  }
}