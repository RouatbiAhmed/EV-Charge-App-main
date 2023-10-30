

import 'dart:convert';
import 'package:evchstation/controller/add-photo-controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


final photocontroller = Get.put(PhotoController());

Future<void> postData({
  required String imagebase64,
  required int ID,
  required String desciptiontext,
}) async {
  const String url ='https://api.openchargemap.io/v3/mediaitem?key=5b031cec-5fa8-4db3-991e-8279fa849a16';

  Map<String, dynamic> body = {
    "chargePointID": ID,
    "comment": desciptiontext,
    "imageDataBase64": "data:image/jpeg;base64,$imagebase64"
  };

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiI0NTg2MyIsIm5vbmNlIjoiMDkzNTM2ZDYtN2YzMC00NjE1LTgwNGItNGIyZTM5NmZhNjg5IiwibmJmIjoxNjk2NzcwMTg5LCJleHAiOjE2OTk0NDg1ODksImlzcyI6Ik9wZW4gQ2hhcmdlIE1hcCIsImF1ZCI6ImFwaS5vcGVuY2hhcmdlbWFwLmlvIn0.fHwaAevP-LPlewp_-FkT8ldB4oC3QVEaYNxDGQEy7h8'
      },
      body: jsonEncode(body),
    );

     photocontroller.setLoading(true);
      await Future.delayed(const Duration(seconds:3));

    photocontroller.setLoading(false);
   
  } catch (error) {
    throw Exception('Error: $error');
  }
}

