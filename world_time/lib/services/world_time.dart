import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the UI
  String time; //the time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime = true; //true or false is daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    //make the request
    try { 
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['utc_datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //set the time property
      isDaytime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("caught error: $e");
      time = "Could not get time data";
    }
  }
}
