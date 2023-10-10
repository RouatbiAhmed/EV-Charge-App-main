

import 'dart:convert';
import 'package:http/http.dart' as http;


const String url = 'https://api.openchargemap.io/v3/mediaitem?key=5b031cec-5fa8-4db3-991e-8279fa849a16';

Future<void> postData({required String imagebase64}) async {
  Map<String, dynamic> body = {
    "chargePointID": 189069,
    "comment": "test1",
    "imageDataBase64": "data:image/jpeg;base64,${imagebase64}"
  };

  try {
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiI0NTg2MyIsIm5vbmNlIjoiMDkzNTM2ZDYtN2YzMC00NjE1LTgwNGItNGIyZTM5NmZhNjg5IiwibmJmIjoxNjk2NzcwMTg5LCJleHAiOjE2OTk0NDg1ODksImlzcyI6Ik9wZW4gQ2hhcmdlIE1hcCIsImF1ZCI6ImFwaS5vcGVuY2hhcmdlbWFwLmlvIn0.fHwaAevP-LPlewp_-FkT8ldB4oC3QVEaYNxDGQEy7h8'
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      print(data);
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('Error: $error');
  }
}




