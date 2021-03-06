import 'package:flutter/material.dart';
import 'package:clima_weather_app/utilities/constants.dart';
import 'package:clima_weather_app/Screens/location_screen.dart';
import 'package:clima_weather_app/services/network.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  GetNetworkLocationData getNetworkLocationData = new GetNetworkLocationData();

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value){
                    cityName=value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter City Name',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10.0),
                      borderSide:BorderSide.none,
                    ),
                  ),

                ),
              ),
              FlatButton(
                onPressed: () {

                  getNetworkLocationData.getCityResponse(cityName)
                      .whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(data: getNetworkLocationData.city_data,))));

                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}