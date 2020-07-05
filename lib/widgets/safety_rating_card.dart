import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SafetyRatingCard extends StatefulWidget {
  final double rating;
  final String title;

  const SafetyRatingCard({Key key, this.rating, this.title}) : super(key: key);
  @override
  _SafetyRatingCardState createState() => _SafetyRatingCardState();
}

class _SafetyRatingCardState extends State<SafetyRatingCard> {
  Widget getLikely(){
    if (widget.rating < 20 ) {
      return Text('Not Likely');
    } else if (widget.rating < 40) {
      return Text('Possible');
    } else if (widget.rating <60) {
      return Text('Neutral');
    } else if (widget.rating <80) {
      return Text('Likely');
    } else {
      return Text('Very Likely');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(25)),
            color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Text(widget.title,textAlign: TextAlign.center, style: TextStyle(
            fontSize: 18,
            ),
          ),
        Divider(color: Colors.black, thickness: 1,),
        Text('Rating', style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
        Text(
          '${widget.rating.toString()}/100', style: TextStyle(
          fontSize: 15
          ),
        ),
        Slider(
          min: 0,
          max: 100,
          value: widget.rating,
          activeColor: Colors.green,
          inactiveColor: Colors.grey,
          onChanged: (newRating){
          },
          label: widget.title,
        ),
          getLikely()
        ],
      ),
    );
  }
}
