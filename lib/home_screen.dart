import 'dart:collection';
import 'dart:developer';
import 'package:evchstation/api/get-stations.dart';
import 'package:evchstation/controller/Auth/logincontroller.dart';
import 'package:evchstation/controller/arguments.dart';
import 'package:evchstation/controller/currentlocationcontroller.dart';
import 'package:evchstation/controller/homeController.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:evchstation/models/user/user.dart';
import 'package:evchstation/screens/poi-details.dart';
import 'package:evchstation/widgets/markerpopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'models/poi/connections/connection.dart';

class HomeScreen extends StatelessWidget {
  final AuthController authcontroller =Get.put(AuthController(), permanent: true);
    final CurrentLocationController locationcontroller =Get.put(CurrentLocationController(), permanent: true);

  final HomeController homeController =
      Get.put(HomeController()); // Associe HomeController à HomeScreen

  var mymarkers = HashSet<Marker>();
  List<Poi> pois = [];

  Poi? desiredPoi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          title: Text("${authcontroller.getname()}"),
        ),*/
        //______Google Maps________

        body: FutureBuilder(
      future: getPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //  List<Poi> pois = [];

          for (int i = 0; i < snapshot.data.length; i++) {
            Poi poi = Poi.fromJson(snapshot.data[i]);
            pois.add(poi);
            LatLng position =LatLng(poi.addressInfo.latitude, poi.addressInfo.longitude);

            Marker marker = Marker(
                icon: poi.statusType!.title == "Planned For Future Date"
                    ? BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueRed)
                    : (poi.Connec![0]["LevelID"] == 2
                        ? BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueBlue)
                        : (poi.Connec![0]["LevelID"] == 3
                            ? BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueGreen)
                            : BitmapDescriptor.defaultMarkerWithHue(
                                BitmapDescriptor.hueOrange))),
                markerId: MarkerId(i.toString()),
                position: position,
                infoWindow: InfoWindow(title: poi.id.toString()),
                onTap: () {
                  // String text=poii.connections.
                  Get.to(() => PoiDetails(),
                      arguments: Arguments(
                        addressinfo: poi.addressInfo,
                        id: poi.id,
                        operatorinfo: poi.operatorinfo,
                        numberofpoints: poi.numberOfPoints ?? 0,
                        statustype: poi.statusType,
                        usagecost: poi.UsageCost,
                        //--Connection-----
                        //----------usage restiction
                        statustypetitle: poi.statusType!.title ?? "Unknown",
                        usagetypetitle: poi.usageType!.title ?? "Unknown",
                        //currenttype: poi.CurrentType ?? "Unknown",
                        usercomment:poi.usercomment??[],
                        //usercomment:poi.usercomment??[],
                        connection: poi.Connec ?? [],
                        media: poi.Media ?? ["No Photos"],
                        //opinf: poi.OperInfo,
                      ));
                });

            mymarkers.add(marker);
          }

          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                locationcontroller.latitude.value,locationcontroller.longitude.value
                  //pois[0].addressInfo!.latitude, //pois
                  //pois[0].addressInfo!.longitude
                  ), //pois
              zoom: 12.0,
            ),
            markers: mymarkers,
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
