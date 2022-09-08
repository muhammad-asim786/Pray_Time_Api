import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:prayer_app_1/screens/timing_screen.dart';
import 'package:prayer_app_1/services/model.dart';
import 'package:prayer_app_1/utils/constants.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  initState() {
    super.initState();
    myLocation();
  }

  myLocation() async {
    var prayersTiming=await Model().getLocationByLatLon();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TimingScreen(
              receivedData: prayersTiming,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'images/madina_city_loading.png',
              fit: BoxFit.fitHeight,
              height: 200,
            ),
            Stack(
              children: [
                SpinKitFadingCircle(
                  color: Colors.white,
                  size: 200,
                ),
                Positioned(
                  left: 120,
                  right: 120,
                  top: 70,
                  child: Container(
                      width: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 20),
                      child: Text(
                        'Prayer App',
                        style:kTimingLabel,
                      )),
                ),

              ],
            ),
             ],
        ),
      ),
    );
  }
}
