import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatefulWidget {
  Map? dataTime;
  Home({this.dataTime, super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;

    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(title: Text('hello')),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: [
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      Navigator.pushNamed(context, "/location");
                    });
                  },
                  icon: const Icon(Icons.location_city),
                  label: const Text("choose a city"),
                ),
                Text(
                  '${data['location']}',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  '${data['time']}',
                  style: const TextStyle(
                    fontSize: 70,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
