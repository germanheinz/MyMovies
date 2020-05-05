import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mymovies/src/pages/widgets/card_swiper_widget.dart';
import 'package:mymovies/src/providers/movie_provider.dart';

class HomePage extends StatelessWidget {
  
  final moviesProvider = new MoviesProvider();

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

  return FutureBuilder(
    future: moviesProvider.getInTheatres(),
    builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
      if(snapshot.hasData){
        return CardSwiper(movies: snapshot.data);
      } else {
        return Container(height: 400.0,child: Center(child: CircularProgressIndicator()));
      }
    },
  );
  }
}