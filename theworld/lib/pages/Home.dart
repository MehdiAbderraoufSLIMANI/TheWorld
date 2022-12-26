// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    String theimgBackgr = data['isday'] ? '2.jpg' : '1.jpg';
    Color bgScafforld = data['isday']
        ? const Color.fromARGB(255, 86, 179, 255)
        : const Color.fromARGB(255, 50, 71, 139);

    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: bgScafforld,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/$theimgBackgr"),
                  fit: BoxFit.cover)),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(context, "/");
                      });
                    },
                    icon: const Icon(
                      Icons.location_city,
                      color: Colors.black,
                    ),
                    label: const Text(
                      "choose a city",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Text(
                    '${data['location']}',
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 50),
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
      ),
    );
  }
}
