import 'package:get/get.dart';

class CommentController extends GetxController{
   RxBool chargestatus=true.obs;
   RxDouble rate=5.0.obs;
    bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    update(); 
  }

}









