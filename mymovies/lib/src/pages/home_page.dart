import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:mymovies/src/pages/widgets/card_swiper_widget.dart';
import 'package:mymovies/src/pages/widgets/movie_horizontal.dart';
import 'package:mymovies/src/providers/movie_provider.dart';
import 'package:mymovies/src/search/search_delegate.dart';

class HomePage extends StatelessWidget {
  
  final moviesProvider = new MoviesProvider();

  @override
  Widget build(BuildContext context) {
    moviesProvider.getPopulars();
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in threatres'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
      body: Container(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _swiperTarjetas(),
          _footer(context)
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

  Widget _footer(BuildContext context){
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populars', style: Theme.of(context).textTheme.subhead)
          ),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: moviesProvider.popularsStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot){
              if(snapshot.hasData){
                return MovieHorizontal(movies: snapshot.data, nextPage: moviesProvider.getPopulars);
              }else{
                return Center(child: CircularProgressIndicator());
              }
              // print(snapshot.data);
              // snapshot.data?.forEach((f) => print(f.title));
              
              // return Container();
            },
          ),
        ],
      ),
    );
  }

}