import 'package:flutter/material.dart';
import 'package:prayer_app_1/utils/constants.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  List<String> myList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/madina_city1.jpg'),
            fit: BoxFit.fitHeight,
            opacity: 0.35,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){Navigator.of(context).pop();},icon: Icon(Icons.arrow_back_rounded, size: 35,),)),
              SizedBox(height: 40,),
              kTextFieldStyle(myList, 'City',0,Icons.location_city),
              kTextFieldStyle(myList, 'Country',1,Icons.flag),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.of(context).pop(myList);
              }, child: Text('Show Location',style: kTimingLabel.copyWith(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w700),)),
            ],
          ),
        ),
      ),
    );
  }
}
