import 'dart:convert';

import 'package:http/http.dart' as http;

final customUserAgent = 'MonApp/1.0';
Future getPost() async {
  final headers = {
    'User-Agent':"${customUserAgent}", // Remplacez par votre en-tête User-Agent personnalisé
  };
  //189069   279083
  //var url ="https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&maxresults=10&ID=189069";
  //var url ="https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&maxresults=10&ID=279083";
   var url  ="https://api.openchargemap.io/v3/poi?key=5b031cec-5fa8-4db3-991e-8279fa849a16&maxresults=926";

  var responce = await http.get(Uri.parse(url), headers: headers);

  var responcebody = jsonDecode(responce.body);

  //posts.addAll(responcebody);
  return responcebody;
}
