import 'dart:convert';
import 'package:evchstation/models/poi/poi.dart';
import 'package:http/http.dart' as http;

const customUserAgent = 'MonApp/1.0';


Future<List<Poi>> getPost(double distanceInMeters,double latitude,double longitude) async {

  final headers = {
    'User-Agent': "${customUserAgent}",
  };

  // var url = "https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&distance=$distanceInMeters&latitude=$latitude&longitude=$longitude";
    //var url = "https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&distance=90000000&latitude=35.840493 &longitude=10.622152";
   //var url ="https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&maxresults=10&ID=279049";
   var url = "https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&maxresults=900&ID=279325";

  var response = await http.get(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    List<dynamic> responseData = jsonDecode(response.body);
    List<Poi> pois = [];

    for (var poiData in responseData) {
      Poi poi = Poi.fromJson(poiData);
      pois.add(poi);
    }
    return pois;
  } else {
    throw Exception('Failed to load data');
  }
}


















