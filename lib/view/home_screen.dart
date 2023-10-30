import 'package:evchstation/api/get-stations.dart';
import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:evchstation/controller/currentlocationcontroller.dart';
import 'package:evchstation/controller/homeController.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:evchstation/view/poi-details.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  final PoiDetailsController poiController = Get.find();
  final AuthController authcontroller = Get.find();
  final CurrentLocationController locationController =Get.put(CurrentLocationController());

  @override
  Widget build(BuildContext context) {
    Set<Circle> circles = Set.from([
      Circle(
        strokeColor: Colors.blue,
        circleId: const CircleId("0"),
        center: LatLng(locationController.latitude.value,
            locationController.longitude.value),
        radius: 160,
      )
    ]);

    return Scaffold(
      body: FutureBuilder<List<Poi>>(
        future: getPost(5000,35.825603,10.608395 /*locationController.longitude.value, locationController.longitude.value*/),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Poi> pois = snapshot.data!;
            pois.forEach((poi) {
              LatLng position = LatLng(poi.addressInfo?.latitude ?? 0,
                  poi.addressInfo?.longitude ?? 0);

              Marker marker = Marker(
                icon: getMarkerIcon(poi),
                markerId: MarkerId(poi.id.toString()),
                position: position,
                infoWindow: InfoWindow(title: poi.addressInfo?.title??"Unknown".toString()),
                onTap: () {
                  poiController.updatePoi(poi);
                  Get.to(() => PoiDetails());
                },
              );

              homeController.addMarker(marker);
            });

            return Obx(
              () => GoogleMap(
                initialCameraPosition: CameraPosition(
                  // My position
                  target: LatLng(locationController.latitude.value,locationController.longitude.value),
                  zoom: 12.0,
                ),
                circles: circles,
                markers: homeController.markers.toSet(),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  //Get marker color
  BitmapDescriptor getMarkerIcon(Poi poi) {
    if (poi.statusType?.title == "Planned For Future Date") {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    } else if (poi.Connec![0]["LevelID"] == 2) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue);
    } else if (poi.Connec![0]["LevelID"] == 3) {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    } else {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange);
    }
  }


}
