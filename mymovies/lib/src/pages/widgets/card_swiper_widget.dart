import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {
  
  // const CardSwiper({Key key}) : super(key: key);
  
  final List<dynamic> movies;

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
         child: Image.network(
          "http://via.placeholder.com/288x188",
          fit: BoxFit.cover,
        ));
      },
      itemCount: movies.length,
      ),
    );
  }
}