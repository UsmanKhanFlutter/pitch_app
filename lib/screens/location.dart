import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:pitch_app/helpers/size_config.dart';

class MyCurrentLocation extends StatefulWidget {
  const MyCurrentLocation({Key key}) : super(key: key);

  @override
  _MyCurrentLocationState createState() => _MyCurrentLocationState();
}

class _MyCurrentLocationState extends State<MyCurrentLocation> {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;
  double latitude;
  double longitude;
  static const GOOGLE_API_KEY = "AIzaSyCSdrFyxyy9tqE-cEy76e4pszwI-Y1cMG0";
  Future loc() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    print(".///////////////");
    _locationData = await location.getLocation();
    setState(() {
      latitude = _locationData.latitude;
      longitude = _locationData.longitude;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=11&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY"))),
      ),
    );
  }
}
