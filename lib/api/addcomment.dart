import 'dart:convert';
import 'package:evchstation/controller/commentcontroller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

final commentcontroller = Get.put(CommentController());

void postData(
    {required String comment,
    required double rate,
    required int status,
    required int ID}) async {
  commentcontroller.isLoading.value = true;
  const url ='https://api.openchargemap.io/v3/comment?key=5b031cec-5fa8-4db3-991e-8279fa849a16';
  final Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization':'Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJVc2VySUQiOiI0NTg2MyIsIm5vbmNlIjoiMDkzNTM2ZDYtN2YzMC00NjE1LTgwNGItNGIyZTM5NmZhNjg5IiwibmJmIjoxNjk2NzcwMTg5LCJleHAiOjE2OTk0NDg1ODksImlzcyI6Ik9wZW4gQ2hhcmdlIE1hcCIsImF1ZCI6ImFwaS5vcGVuY2hhcmdlbWFwLmlvIn0.fHwaAevP-LPlewp_-FkT8ldB4oC3QVEaYNxDGQEy7h8'
  };

  final Map<String, dynamic> body = {
    'chargePointID': ID,
    'commentTypeID': 10,
    'userName': 'Ahmed',
    'comment': comment,
    'rating': rate,
    'relatedURL': 'string',
    'checkinStatusTypeID': status
  };

  try {
    final response = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(body));
    final Map<String, dynamic> data = json.decode(response.body);
    commentcontroller.isLoading.value = false;
    print(data);
  } catch (error) {
    commentcontroller.isLoading.value = false;
    print(error);
  }
}
