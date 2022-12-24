import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class worldTime {
  String? location;
  String? time;
  String? flag;
  String endPoint = 'Africa/Algiers';
  worldTime({required this.endPoint});
  bool isday = true;
  Future<void> getTime() async {
    //! semulation of geteing data
    try {
      var url = Uri.https('worldtimeapi.org', 'api/timezone/$endPoint');

      RegExp regExp = RegExp(r"(?<=/).*");

      location = regExp.firstMatch(endPoint)!.group(0);
      // ignore: non_constant_identifier_names
      Response Respon = await get(url);
      Map data = jsonDecode(Respon.body);
      print(data);
      String datetime = data['datetime'];
      int offsatHours = int.parse(data['utc_offset'].substring(1, 3));
      int offsatMinuts = int.parse(data['utc_offset'].substring(4, 6));

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: offsatHours, minutes: offsatMinuts));

      int the_houre = int.parse(DateFormat.H().format(now));

      isday = ((the_houre >= 7) && (the_houre <= 15))
          ? isday = true
          : isday = false;

      time = DateFormat.jm().format(now);

      //print('${now.hour}:${now.minute}:${now.second}');
    } catch (e) {
      time = 'there is a errour Try again';
      print(e);
    }
  }
}
