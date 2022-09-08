import 'package:prayer_app_1/services/location_file.dart';
import 'package:prayer_app_1/services/networking.dart';

class Model{
 Future<dynamic> getLocationByLatLon()async{
    Location location = Location();
    var getLocation = await location.myCurrentLocation();
    print('Latitude: ${getLocation.latitude}');
    print('Longitude: ${getLocation.longitude}');

    Network network = Network(Uri.parse(
        'http://api.aladhan.com/v1/timings?latitude=${getLocation.latitude}&longitude=${getLocation.longitude}&method=8&school=1'));
    var prayersTiming = await network.getData();
    return prayersTiming;
  }
  Future<dynamic> getLocationByCityCoutry(List<String> myList)async{
        Network network = Network(Uri.parse(
        'http://api.aladhan.com/v1/timingsByCity?city=${myList[0].toString()}&country=${myList[1].toString()}&method=8&school=1'));
    var prayersTiming = await network.getData();
    return prayersTiming;
  }

}