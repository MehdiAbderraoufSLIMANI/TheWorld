import 'package:flutter/material.dart';

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
    print(theimgBackgr);
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(title: const Text('hello')),
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
                        Navigator.pushNamed(context, "/location");
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
