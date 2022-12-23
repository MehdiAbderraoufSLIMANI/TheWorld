import 'package:http/http.dart';
import 'dart:convert';

class worldTime {
  String? location;
  String? time;
  String? endPoint = 'Africa/Algiers';
  worldTime({required this.endPoint});

  Future<void> getTime() async {
    //! semulation of geteing data
    var url = Uri.https('worldtimeapi.org', 'api/timezone/$endPoint');

    location = endPoint?.replaceAll(RegExp(r'/'), ' ');
    Response Respon = await get(url);
    Map data = jsonDecode(Respon.body);
    print(data);
    String datetime = data['datetime'];
    int offsatHours = int.parse(data['utc_offset'].substring(1, 3));
    int offsatMinuts = int.parse(data['utc_offset'].substring(4, 6));

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: offsatHours, minutes: offsatMinuts));

    time = now.toString();
    //print('${now.hour}:${now.minute}:${now.second}');
  }
}
