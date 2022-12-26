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
    var wt = ModalRoute.of(context)!.settings.arguments as worldTime;
    await wt.getTime();
    await Future.delayed(const Duration(seconds: 1));

    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'time': wt.time,
      'location': wt.location,
      'flag': wt.flag,
      'isday': wt.isday,
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
  }

  @override
  Widget build(BuildContext context) {
    steupTime();
    return Scaffold(
        body: Center(
      child: LoadingAnimationWidget.halfTriangleDot(
        size: 50,
        color: Colors.black,
      ),
    ));
  }
}
