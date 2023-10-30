import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class CurrentLocationController extends GetxController {
  @override
  void onInit() async {
    await getUserLocation();
    super.onInit();
  }

  dynamic currentWeatherData;
  var latitude = 30.0.obs;
  var longitude = 50.0.obs;
  var isloaded = false.obs;
  //Get User location
  getUserLocation() async {
    bool isLocationEnabled;
    LocationPermission userPermission;

    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return Future.error("Location is not enabled");
    }

    userPermission = await Geolocator.checkPermission();
    if (userPermission == LocationPermission.deniedForever) {
      return Future.error("Permission is denied forever");
    } else if (userPermission == LocationPermission.denied) {
      userPermission = await Geolocator.requestPermission();
      if (userPermission == LocationPermission.denied) {
        return Future.error("Permission is denied");
      }
    }

    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      latitude.value = value.latitude;
      longitude.value = value.longitude;
      isloaded.value = true;
    });
  }
}
