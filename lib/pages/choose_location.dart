import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.jpg'),
    WorldTime(url: 'Europe/Madrid', location: 'Madrid', flag: 'spain.jpg'),
    WorldTime(url: 'Europe/Rome', location: 'Rome', flag: 'italy.jpg'),
    WorldTime(url: 'Europe/Oslo', location: 'Oslo', flag: 'norway.jpg'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.jpg'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.jpg'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.jpg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.jpg'),
    WorldTime(url: 'Asia/Hong_Kong', location: 'Hong Kong', flag: 'hong_kong.jpg'),

  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {   //Build() => builds the widget tree, a build is triggered every time we use setState()
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(       // this is for the layout, allows us to put an image and a text right next to it
                  onTap: () {
                    updateTime(index);
                    //print(locations[index].location);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
              ),
            ),
          );
        }
      ),
    );
  }
}

