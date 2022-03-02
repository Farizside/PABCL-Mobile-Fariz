import 'dart:convert';
import 'package:resep_makanan/model/resep.dart';
import 'package:http/http.dart' as http;

class ResepApi {
// var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
  // "limit": "18",
  // "start": "0"
// });

// req.headers({
  // "x-rapidapi-host": "yummly2.p.rapidapi.com",
  // "x-rapidapi-key": "54f1db575fmshacb6b802134a0f8p1fb2abjsnc9ef87146bea",
  // "useQueryString": true
// });

  static Future<List<Resep>> getResep() async {
    var uri = Uri.https('tasty.p.rapidapi.com', '/recipes/list',
        {"from": "0", "size": "20", "tags": "under_30_minutes"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "tasty.p.rapidapi.com",
      "x-rapidapi-key": "54f1db575fmshacb6b802134a0f8p1fb2abjsnc9ef87146bea",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);

    List _temp = [];

    for (var i in data['results']) {
      _temp.add(i);
    }
    return Resep.resepFromsnapshot(_temp);
  }
}
