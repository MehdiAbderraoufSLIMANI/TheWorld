import 'package:flutter/material.dart';
import 'package:theworld/modles/TheTime.dart';
import 'package:theworld/modles/Locationlist.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'loading...';

  void steupTime() async {
    worldTime wt = worldTime(endPoint: "Africa/Algiers");
    await wt.getTime();
    setState(() {
      time = wt.time;
    });
  }

  // ignore: non_constant_identifier_names
  Future<List> Location() async {
    Locationlist l = Locationlist();
    List list = await l.getLocation();
    return list;
  }

  @override
  void initState() {
    super.initState();
    steupTime();
    // Navigator.pushReplacementNamed(context, "/home");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(time!),
          ],
        ),
      ),
    );
  }
}
