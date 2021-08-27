import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitch_app/helpers/size_config.dart';
import 'package:pitch_app/screens/screen_signin_method.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:location/location.dart';

class LocationDialog extends StatefulWidget {
  @override
  _LocationDialogState createState() => _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
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

  Widget checkUrl(String url) {
    try {
      return Image.network(url, height: 70.0, width: 70.0, fit: BoxFit.cover);
    } catch (e) {
      return Icon(Icons.image);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: VStack(
            [
              'Allow "PitchMe" use your\n location'
                  .text
                  .align(TextAlign.center)
                  .bold
                  .make()
                  .pSymmetric(v: 24),
              'PitchMe uses your location to introduce you to singles in your area'
                  .text
                  .size(13)
                  .color(Colors.grey.shade700)
                  .make()
                  .pSymmetric(h: 16),
              SizedBox(height: 16),
              Container(
                height: ConfigSize.convertHeight(context, 220),
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=11&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY"))),
              ),
              SizedBox(height: 16),
              _dialogButton(
                  text: 'Allow Once',
                  onPressed: () {
                    loc().whenComplete(() => {
                          Future.delayed(Duration(seconds: 3), () {
                            Get.off(SignInMethodScreen());
                          })
                        });
                  }),
              SizedBox(height: 8),
              _dialogButton(
                  text: 'Allow while using app',
                  onPressed: () {
                    loc().whenComplete(() => {
                          Future.delayed(Duration(seconds: 3), () {
                            Get.off(SignInMethodScreen());
                          })
                        });
                  }),
              SizedBox(height: 8),
              _dialogButton(
                  text: "Don't Allow",
                  onPressed: () {
                    Get.off(SignInMethodScreen());
                  }),
            ],
            crossAlignment: CrossAxisAlignment.center,
          ),
        ),
      ),
    );
  }
}

_dialogButton({@required String text, @required Function onPressed}) {
  return Container(
    width: double.infinity,
    height: 34,
    child: MaterialButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      onPressed: onPressed,
      child: "$text".text.make(),
      color: Colors.grey.shade200,
      elevation: 0,
    ),
  ).pSymmetric(h: 16);
}

Future<Widget> locationDialog(BuildContext context) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.white60,
          insetPadding: EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: LocationDialog(),
        );
      });
}
