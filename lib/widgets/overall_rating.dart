import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverallRating extends StatelessWidget {
  final double rating;

  const OverallRating({Key key, this.rating}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    Widget getStars(){
      if (rating < 1){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.star_half, color: Colors.yellow,size: 30),
          Icon(Icons.star_border, color: Colors.yellow,size: 30),
          Icon(Icons.star_border, color: Colors.yellow,size: 30),
          Icon(Icons.star_border, color: Colors.yellow,size: 30),
          Icon(Icons.star_border, color: Colors.yellow,size: 30)
        ],
      );
      } else if (rating == 1) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );
      }
      else if( rating < 2 ){
       return Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_half, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );
      } else if (rating == 2) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );
      } else if (rating < 3) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_half, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );
      } else if (rating == 3) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );
      } else if (rating < 4) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_half, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );
      } else if (rating == 4) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star_border, color: Colors.yellow,size: 30)
          ],
        );

      } else if (rating < 5) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow, size: 30,),
            Icon(Icons.star, color: Colors.yellow, size: 30,),
            Icon(Icons.star, color: Colors.yellow, size: 30,),
            Icon(Icons.star, color: Colors.yellow,size: 30,),
            Icon(Icons.star_half, color: Colors.yellow, size: 30,)
          ],
        );

      } else if (rating == 5 ) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30),
            Icon(Icons.star, color: Colors.yellow,size: 30)
          ],
        );
      }
    }

    return Container(
      child: getStars(),
      width: MediaQuery.of(context).size.width,
    );
  }
}
