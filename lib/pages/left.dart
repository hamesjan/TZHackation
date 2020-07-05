import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hackation/widgets/safety_rating_card.dart';
import 'package:hackation/widgets/overall_rating.dart';
import 'package:hackation/classes/safety_info.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LeftPage extends StatefulWidget {
  @override
  _LeftPageState createState() => _LeftPageState();
}

class _LeftPageState extends State<LeftPage> {

  Future<Safety> getInfo() async {
    //Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    var url ='https://us-central1-aiot-fit-xlab.cloudfunctions.net/safetyScore';

    Map data = {
      'lat': 40.7128,
      'lon': -74.0060
    };
  //  print(position.toString());

    //encode Map to JSON
    var body = json.encode(data);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    return safetyFromJson(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blueAccent,
              Colors.deepPurpleAccent
            ]
          )
        ),
        child:  SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: FutureBuilder(
            future: getInfo(),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.done){
                return Column(
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('You are in:', style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30
                          ),),
                          Text('New York, New York', style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22
                          ),),
                          Divider(thickness: 2, color: Colors.white,),
                          Text('Overall Safety Rating', style: TextStyle(
                              fontSize: 22,
                              color: Colors.white
                          ),),
                          SizedBox(height: 5,),
                          OverallRating(rating: snapshot.data.overall / 20,),
                          SizedBox(height: 5,),
                          Text("${snapshot.data.overall / 20} / 5", style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),),
                          Divider(thickness: 2, color: Colors.white,)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text('Safety Information',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SafetyRatingCard(
                      rating: snapshot.data.women / 1 ,
                      title: "Likelihood of inappropriate behavior against females",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SafetyRatingCard(
                      rating: snapshot.data.physical / 1,
                      title: "Likelihood of injury due to harmful intent",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SafetyRatingCard(
                      rating: snapshot.data.theft /1,
                      title: "Likelihood of theft",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SafetyRatingCard(
                      rating: snapshot.data.political /1 ,
                      title: "Potential for infringement of political rights or political unrest",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SafetyRatingCard(
                      rating: snapshot.data.lgbtq / 1,
                      title: "Likelihood of harm or discrimination against LGBTQ persons",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SafetyRatingCard(
                      rating: snapshot.data.medical / 1,
                      title: "Likelihood of illness or disease, assessment of water and air quality, and access to reliable medical care",
                    ),
                  ],
                );
              } else return Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator()
                  ],
                ),
              );
            },
          )
        ),
      )
    );
  }
}


