// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:theworld/modles/TheTime.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<worldTime> locations = [
    worldTime(endPoint: 'Europe/London', flag: 'uk.png'),
    worldTime(endPoint: 'Europe/Berlin', flag: 'greece.png'),
    worldTime(endPoint: 'Africa/Cairo', flag: 'egypt.png'),
    worldTime(endPoint: 'Africa/Nairobi', flag: 'kenya.png'),
    worldTime(endPoint: 'America/Chicago', flag: 'usa.png'),
    worldTime(endPoint: 'America/New_York', flag: 'usa.png'),
    worldTime(endPoint: 'Asia/Seoul', flag: 'south_korea.png'),
    worldTime(endPoint: 'Asia/Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('choose a city'),
        ),
        body: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: (() {
                    Navigator.pushReplacementNamed(context, "/l",
                        arguments: locations[index]);
                  }),
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}')),
                ),
              );
            }));
  }
}
