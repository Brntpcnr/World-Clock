import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  late String location; // location name for the UI
  late String time; // the time in that location
  late String flag; // url to an asset flag icon
  late String url; // location url for api endpoint
  late bool isDayTime; // if true its gonna be day, if wrong its gonna be night


  WorldTime({required this.location, required this.flag, required this.url });

  Future <void> getTime() async {

    try {
      //make the request
      Response response = await get(Uri.http('www.worldtimeapi.org','/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(0,3); //here we normally do (1,3) but when we come across negative time zones, LA for example , we use (0,3)
      // print(datetime);
      //print(offset);

      // create a DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset))); //int.parse gonna take a string and turn it into integer

      //set the time property
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = DateFormat.jm().format(now);

      }

    catch (e) {
      print('caught error: $e');
      time = 'could not get time data';
    }



  }

}






//  void getData() async {

//simulate network request for a username
// String username = await Future.delayed(Duration(seconds: 3), () {
//   return 'takoma';
// });
//
// //simulate network request to get bio of the username
// String bio = await Future.delayed(Duration(seconds: 2), () {
//   return 'nihilist, machievellist & egg collector';
// });
//
// print('$username - $bio');

//@override


//note
// Replace the line:
// Response response = await get('https://jsonplaceholder.typicode.com/todos/1');
// with
// Response response = await get(Uri.http('jsonplaceholder.typicode.com', '/todos/1' ));
