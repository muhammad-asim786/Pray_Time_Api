import 'package:flutter/material.dart';
import 'package:prayer_app_1/services/model.dart';



var kTimingLabel=TextStyle(
fontSize: 20.0,
fontWeight: FontWeight.bold,
shadows: [
   Shadow(
    color: Colors.grey.shade800,
    offset: Offset(0.0, 1.0),
    blurRadius: 2.0,
  ),
],
letterSpacing: 0.7);


Widget myTimeContainer({Widget? myChild, Color? clr}){
  return Expanded(
    child: Container(
      margin: EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: clr!.withOpacity(0.55),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      child:myChild,
    ),
  );
}

Widget myTimeText(String labelText, String labelTime){
  return  Row(
    mainAxisAlignment:MainAxisAlignment.spaceBetween,
    children: [
      Text('$labelText',style: kTimingLabel,),
      Text('$labelTime',style: kTimingLabel,),
    ],
  );
}


Widget kTextFieldStyle(List<String> myList, String textFieldFor,int myValue, IconData icon){
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
    child: TextField(
      cursorColor: Colors.white,
      style: TextStyle(
          color: Colors.white
      ),
      decoration: InputDecoration(
        icon: Icon(icon,size: 35,color: Colors.white,),
        hintText: 'Enter $textFieldFor Name',
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.orange.withOpacity(0.25),
        filled: true,
      ),
      onChanged: (value){
          myList.add(value);
          myList[myValue] = value;
        // myList.add(value);
      },
    ),
  );
}


String time24to12Format(String time) {
  int h = int.parse(time.split(":").first);
  int m = int.parse(time.split(":").last.split(" ").first);
  String send = "";
  if (h == 12) {
    send =
        "$h:${m
            .toString()
            .length == 1 ? "0" + m.toString() : m.toString()} " +
            "PM";
  }
  else if (h > 12 && h<24) {
    var temp = h - 12;
    if(temp>9){
      send="$temp:${m
          .toString()
          .length == 1 ? "0" + m.toString() : m.toString()} " +
          "PM";
    }
    else{
      send =
          "0$temp:${m.toString().length == 1 ? "0" + m.toString() : m.toString()} " +
              "PM";
    }
  }

  else if (h == 00) {
    h=24;
    var temp=h-12;
    send =
        "$temp:${m
            .toString()
            .length == 1 ? "0" + m.toString() : m.toString()} " +
            "AM";
  }

  else {
    if(h>9){
      send =
          "$h:${m.toString().length == 1 ? "0" + m.toString() : m.toString()}  " +
              "AM";
    }
    else{
      send =
          "0$h:${m.toString().length == 1 ? "0" + m.toString() : m.toString()}  " +
              "AM";

    }
  }
  return send;
}

