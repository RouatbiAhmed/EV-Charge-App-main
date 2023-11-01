import 'package:evchstation/controller/homeController.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:evchstation/view/add-media-items/addcomment.dart';
import 'package:evchstation/view/toggle/toggle.dart';
import 'package:evchstation/view/user-profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add-media-items/addphoto.dart';

class PoiDetails extends StatelessWidget {
  PoiDetails({super.key});

   final HomeController homeController = Get.find<HomeController>();

   
    final PoiDetailsController poiController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body:Obx(() {
        final Poi? poi = poiController.poi.value;
      return SafeArea(
        child:
            //Cover Photo
            Container(
                width: double.infinity,
                height: screenHeight,
                child: Stack(
                  children: [
                    Positioned(
                        top: screenHeight * 0,
                        left: screenWidth * 0,
                        child: Container(
                          height: screenHeight * 0.2,
                          width: screenWidth,
                          child: Stack(
                            children: [
                             if ( poi!.Media != null &&  poi.Media![0] != "No Photos")

                                Container(
                                  height: screenHeight * 0.2,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(poi.Media![0]['ItemURL'].toString()), 
                                      fit: BoxFit.cover, 
                                    ),
                                  ),
                                )
                              else
                                Container(
                                  height: screenHeight * 0.2,
                                  width: screenWidth,
                                  color: const Color(0xFF28AAB1),
                                ),

                              Container(
                                height: screenHeight * 0.2,
                                width: screenWidth,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Charge Station ${poi.addressInfo?.title ??"Unknown"}",
                                        style:const TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "OCM-${poi.id}",
                                        style:const TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "${poi.Connec![0]['ConnectionType']['Title']}",
                                        style:const TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        poi.operatorinfo?.title ?? "Unknown",
                                        style:const TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Positioned(
                        top: screenHeight * 0.2,
                        left: screenWidth * 0.04,
                        child: ToggleSwitchExample()
                        ),
                    Positioned(
                      top: screenHeight * 0.02,
                      left: screenWidth * 0.8,
                      child: MaterialButton(
                        onPressed: () {},
                        child: Obx(
                          () => Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                   SizedBox(height: screenHeight*0.02),
                                  FloatingActionButton(
                                    heroTag: "openandclose",
                                    onPressed: () {
                                      poiController.toggleExpanded();
                                    },
                                    child: Icon(poiController.isExpanded.value
                                        ? Icons.close
                                        : Icons.add),
                                  ),
                                  SizedBox(height: screenHeight*0.02),
                                  Visibility(
                                    visible: poiController.isExpanded.value,
                                    child: FloatingActionButton(
                                      heroTag: "addphoto",
                                      onPressed: () {
                                        Get.to(const AddPhoto(),
                                           );
                                      },
                                      child:const Icon(Icons.image),
                                    ),
                                  ),
                                  SizedBox(height: screenHeight*0.02),
                                  Visibility(
                                    visible: poiController.isExpanded.value,
                                    child: FloatingActionButton(
                                      heroTag: "addcomment",
                                      onPressed: () {
                                        Get.to(AddComment());
                                      },
                                      child: const Icon(Icons.comment),
                                    ),
                                  ),
                                    SizedBox(height: screenHeight*0.02),
                                  Visibility(
                                    visible: poiController.isExpanded.value,
                                    child: FloatingActionButton(
                                      heroTag: "profile",
                                      onPressed: () {
                                        
                                        Get.to(UserProfile());
                                      },
                                      child: const Icon(Icons.person),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
      );
      }
     )
    );
  }
}
