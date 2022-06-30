import 'package:flutter/material.dart';
import 'package:clima_weather_app/services/network.dart';
import 'package:clima_weather_app/Screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  GetNetworkLocationData getNetworkLocationData = new GetNetworkLocationData();


  @override
  void initState() {
    super.initState();
    getNetworkLocationData.getResponse()
        .whenComplete(() => Navigator.push(context, MaterialPageRoute(builder: (context)=>LocationScreen(data: getNetworkLocationData.data,))));


  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:SpinKitFadingCircle(
          size: 100.0,
          itemBuilder: (BuildContext context, int index) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: index.isEven ? Colors.red : Colors.green,
              ),
            );
          },
        )
      ),
    );
  }
}