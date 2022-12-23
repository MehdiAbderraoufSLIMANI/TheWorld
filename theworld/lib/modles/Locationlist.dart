import 'package:http/http.dart';
import 'dart:convert';

class Locationlist {
  Future<List> getLocation() async {
    var url = Uri.https('worldtimeapi.org', 'api/timezone/');

    Response Respon = await get(url);
    List data = await jsonDecode(Respon.body);
    return data;
  }
}
