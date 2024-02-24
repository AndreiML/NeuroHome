import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


bool dayOrNight = true;



class WorldTime{

  String location; //location name
  String time = ''; //time in location
  String flag; //url to an asset flag icon
  String url; //location url for api
  late bool isDayTime; //true or false if day or night

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime () async {

    try {

      //make the request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3);
      //print(datetime);
      //print(offset);

      //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);

      //set the time
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      dayOrNight = isDayTime;
      time = DateFormat.H().format(now);

    }
    catch (e){
      print('caught error: $e');
      time = 'could not get time data';
    }



  }

}



