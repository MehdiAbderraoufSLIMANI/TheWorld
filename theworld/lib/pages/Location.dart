import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  void getData() async {
    //! semulation of geteing data
    int a = 0;
    print("wait...");
    await Future.delayed(const Duration(seconds: 3), () {
      a = 1;
      print("mahdi.");
    });

    await Future.delayed(const Duration(seconds: 2), () {
      if (a == 1) {
        print("21.");
      } else {
        print("errour : a = $a");
      }
    });

    print("done");
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('choose a city'),
      ),
      body: const SafeArea(
        child: Text('The Location'),
      ),
    );
  }
}
