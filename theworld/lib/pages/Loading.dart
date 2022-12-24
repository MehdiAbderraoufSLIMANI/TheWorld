import 'package:flutter/material.dart';
import 'package:theworld/modles/TheTime.dart';
import 'package:theworld/modles/Locationlist.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'loading...';
  String? location = 'loading...';
  String? flag = 'loading...';
  void steupTime() async {
    worldTime wt = worldTime(endPoint: "Africa/Algiers");
    await wt.getTime();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'time': wt.time,
      'location': wt.location,
      'flag': wt.flag,
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
