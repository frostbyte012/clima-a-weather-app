import 'package:geolocator/geolocator.dart';

class Location{

  double? latitude;
  double? longitude;

  Future<void> getLocation() async
  {
    try{
      // LocationPermission permission = await Geolocator.requestPermission();
      // print(permission);
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(exception)
    {
      print(exception);
    }
  }

}