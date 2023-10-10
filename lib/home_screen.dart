import 'dart:collection';
import 'dart:developer';
import 'package:evchstation/api/get-stations.dart';
import 'package:evchstation/controller/Auth/logincontroller.dart';
import 'package:evchstation/controller/arguments.dart';
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
  final AuthController authcontroller =
      Get.put(AuthController(), permanent: true);
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
                  pois[0].addressInfo!.latitude, //pois
                  pois[0].addressInfo!.longitude), //pois
              zoom: 12.0,
            ),
            markers: mymarkers,
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}

/*

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
      final AuthController authcontroller=Get.put(AuthController(),permanent: true);
      

  var mymarkers = HashSet<Marker>();
  List<ChatUser> list = [];
  List<Poi> pois = [];

  Poi? desiredPoi;
  
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

        //for hiding keyboard when a tap is detected
        onTap: () => FocusScope.of(context).unfocus(),
        child: WillPopScope(
          onWillPop: () async {
            if (isDialOpen.value) {
              isDialOpen.value = false;
              return false;
            } else {
              return true;
            }
          },

          /*onWillPop: () {
          if (_isSearching) {
            setState(() {
              _isSearching = !_isSearching;
            });
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        },*/
          child: Scaffold(
        appBar: AppBar(title: Text("${authcontroller.getname()}"),),
              //______Google Maps________

              body: FutureBuilder(
            future: getPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                //  List<Poi> pois = [];

                for (int i = 0; i < snapshot.data.length; i++) {
                  Poi poi = Poi.fromJson(snapshot.data[i]);
                  pois.add(poi);
                  LatLng position = LatLng(poi.addressInfo.latitude, poi.addressInfo.longitude);

                  Marker marker = Marker(
                   
                    icon:poi.statusType!.title=="Planned For Future Date"?BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)
                    :(poi.Connec![0]["LevelID"]==2 ?BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue):
                    (poi.Connec![0]["LevelID"]==3 ?BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen):
                     BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange)
                    )),
                           
                      markerId: MarkerId(i.toString()),
                      position: position,
                      infoWindow: InfoWindow(title: poi.id.toString()),
                      onTap: () {
                             
                    // String text=poii.connections.
                        Get.to(() => PoiDetails(),
                            arguments: Arguments(
                              addressinfo:poi.addressInfo,
                              id: poi.id,
                              operatorinfo: poi.operatorinfo,
                              numberofpoints: poi.numberOfPoints ?? 0,
                              statustype: poi.statusType,
                              //--Connection-----
                              //----------usage restiction
                              statustypetitle:poi.statusType!.title ?? "Unknown",
                              usagetypetitle: poi.usageType!.title ?? "Unknown",
                              //currenttype: poi.CurrentType ?? "Unknown",
                              usercomment: poi.UserComment ?? ["No Comments"],
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
                        pois[0].addressInfo!.latitude, //pois
                        pois[0].addressInfo!.longitude), //pois
                    zoom: 12.0,
                  ),
                  markers: mymarkers,
                );
              }

              return const CircularProgressIndicator();
            },
          )),
        ));
  }
}

*/

/*
  Get.to(() => PoiDetails(),
                            arguments: Arguments(
                              title: poi.addressInfo.title,
                              id: poi.id,
                              operatorname: poi.operatorinfo.title,
                              connectiontitle:poi.connectiontitle,
                              addressLine1: poi.addressInfo.addressLine1 ?? "Unknown",
                              town: poi.addressInfo.town ?? "Unknown",
                              stateorprovince:poi.addressInfo.stateOrProvince ?? "Unknown",
                              postcode: poi.addressInfo.postcode ?? "Unknown",
                              countrytitle:poi.addressInfo.country!.title ?? "Unknown",
                              latitude: poi.addressInfo.latitude,
                              longitude: poi.addressInfo.longitude,
                              statustypetitle: poi.statusType!.title ?? "Unknown",
                              usagetypetitle: poi.usageType!.title ?? "Unknown",
                              websiteurl: poi.operatorinfo.websiteUrl ?? "Not found", 
                              numberofpoints:poi.numberOfPoints ?? 0, 
                              power: poi.PowerKW ?? 0,
                              voltage: poi.Voltage ??0 , 
                              apmerage: poi.Amps ??0, 
                              currenttype: poi.CurrentType ??"Unknown",
                              usercomment: poi.UserComment??["No Comments"] ,
                              connection: poi.Connec ?? [],
                              media: poi.Media??["No Photos"],
                              opinf: poi.Lkol ?? {'clé par défaut': 'valeur par défaut'},

                             
                            ));
*/

/*

            appBar: AppBar(
              title: _isSearching
                  ? TextField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name, Email, ...'),
                      autofocus: true,
                      style: const TextStyle(fontSize: 17, letterSpacing: 0.5),
                      onChanged: (val) {
                        //search logic
                        _searchList.clear();

                        for (var i in list) {
                          if (i.name
                                  .toLowerCase()
                                  .contains(val.toLowerCase()) ||
                              i.email
                                  .toLowerCase()
                                  .contains(val.toLowerCase())) {
                            _searchList.add(i);
                            setState(() {
                              _searchList;
                            });
                          }
                        }
                      },
                    )
                  : const Text('Ev Charge Station'),

              //title: const Text("We chat"),
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.home_outlined)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isSearching = !_isSearching;
                      });
                    },
                    icon: Icon(_isSearching
                        ? CupertinoIcons.clear_circled_solid
                        : Icons.search)),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => ProfileScreen(
                                    title: "profile",
                                  )));
                    },
                    icon: const Icon(Icons.more_vert)),
              ],
            ),

*/
