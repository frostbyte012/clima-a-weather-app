import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'location.dart';

const appID="YOUR OPEN WEATHER MAP ID HERE";

class GetNetworkLocationData
{

  var _latitude,_longitude;
  var data;
  var city_data;

    Future<dynamic> getCityResponse(cityName) async{

      if(cityName!=null){

        http.Response response = await http.get(
          Uri.parse(
              "https://api.openweathermap.org/data/2.5/weather?q=${cityName}&appid=${appID}&units=metric"
          ),
        );
        if(response.statusCode==200)
          {
            city_data=response.body;
            var decodeJson=jsonDecode(city_data);
            var temperature=decodeJson["main"]['temp'];
            var condition=decodeJson['weather'][0]["id"];
            var cityName=decodeJson['name'];
            print(temperature);
            print(condition);
            print(cityName);
            print(response.body);
            return city_data;
          }
        else
          {
            print(response.statusCode);
          }

      }

      return city_data;


    }

    Future<dynamic> getResponse () async
    {
      // LocationPermission permission = await Geolocator.checkPermission();
      LocationPermission permission = await Geolocator.requestPermission();
      if(permission==LocationPermission.whileInUse||permission==LocationPermission.always)
    {
      Location location = Location();
       await location.getLocation();
        _latitude=location.latitude;
        _longitude=location.longitude;
        print('Latitude : ${location.latitude}');
        print('Longitude : ${location.longitude}');

      http.Response response = await http.get(
      Uri.parse(
       "https://api.openweathermap.org/data/2.5/weather?lat=${_latitude}&lon=${_longitude}&appid=${appID}&units=metric",
      ),
    );
     if(response.statusCode==200)
   {
      data=response.body;
      var decodeJson=jsonDecode(data);
      var temperature=decodeJson["main"]['temp'];
      var condition=decodeJson['weather'][0]["id"];
      var cityName=decodeJson['name'];
      print(temperature);
      print(condition);
      print(cityName);
      return data;
      // print(response.body);
   }
   else{
      print(response.statusCode);
   }
  }
      else{
        print("Opps!");
    }

    return "";

 }


}