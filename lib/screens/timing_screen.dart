import 'package:flutter/material.dart';
import 'package:prayer_app_1/screens/search_screen.dart';
import 'package:prayer_app_1/services/model.dart';
import 'package:prayer_app_1/utils/constants.dart';

class TimingScreen extends StatefulWidget {
  TimingScreen({this.receivedData, Key? key}) : super(key: key);

  var receivedData;

  @override
  State<TimingScreen> createState() => _TimingScreenState();
}

class _TimingScreenState extends State<TimingScreen> {
  var fajr;
  var dhuhr;
  var asr;
  var maghrib;
  var isha;
  var sunRise;
  var sunSet;
  var midNight;
  String btnText='Change to Shafi';

  @override
  initState() {
    super.initState();
    print(widget.receivedData);
    updateUI(widget.receivedData);
  }

  Model model=Model();
  updateUI(dynamic prayerLocation) {
    setState(() {
      fajr = prayerLocation['data']['timings']['Fajr'];
      sunRise = prayerLocation['data']['timings']['Sunrise'];
      dhuhr = prayerLocation['data']['timings']['Dhuhr'];
      asr = prayerLocation['data']['timings']['Asr'];
      sunSet = prayerLocation['data']['timings']['Sunset'];
      maghrib = prayerLocation['data']['timings']['Maghrib'];
      isha = prayerLocation['data']['timings']['Isha'];
      midNight = prayerLocation['data']['timings']['Midnight'];
    });
  }
  List<String> myList=[];
  String cityName='Peshawar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/madina_city.jpg',
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Opacity(
            opacity: 0.45,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.green,
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () async{
                          await model.getLocationByLatLon();
                          updateUI(widget.receivedData);
                          cityName='Peshawar';
                        },
                        icon: Icon(Icons.near_me,size: 35,),
                      ),
                      IconButton(
                        onPressed: () async{
                          List<String> nameList=await Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchScreen()));
                         if(nameList[0]!=null && nameList[1]!=null){
                           var prayersTiming=await model.getLocationByCityCoutry(nameList);
                           updateUI(prayersTiming);
                         }
                         cityName=nameList[0];
                         myList=nameList;
                        },
                        icon: Icon(Icons.location_city,size: 35,),
                      ),
                    ],
                  ),
                ),
                Text('$cityName',style: kTimingLabel,),
                myTimeContainer(
                  clr: Colors.green,
                  myChild: myTimeText('Fajr', time24to12Format(fajr).toString()),
                ),
                myTimeContainer(
                  clr: Colors.pink,
                  myChild: myTimeText('Sunrise', time24to12Format(sunRise).toString()),
                ),
                myTimeContainer(
                  clr: Colors.red,
                  myChild: myTimeText(
                    'Dhuhr',
                    time24to12Format(dhuhr).toString(),
                  ),
                ),
                myTimeContainer(
                  clr: Colors.blue[700],
                  myChild: myTimeText('Asr', time24to12Format(asr).toString()),
                ),
                myTimeContainer(
                  clr: Colors.teal,
                  myChild: myTimeText('Sunset', time24to12Format(sunSet).toString()),
                ),
                myTimeContainer(
                  clr: Colors.orange,
                  myChild: myTimeText('Maghrib', time24to12Format(maghrib).toString()),
                ),
                myTimeContainer(
                  clr: Colors.purpleAccent,
                  myChild: myTimeText('Isha',time24to12Format(isha).toString()),
                ),
                myTimeContainer(
                  clr: Colors.black,
                  myChild: myTimeText('Midnight',time24to12Format(midNight).toString()),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
