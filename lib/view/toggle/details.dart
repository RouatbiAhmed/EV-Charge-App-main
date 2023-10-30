import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final PoiDetailsController poiController = Get.find();

    return Obx(() {
      final Poi? poi = poiController.poi.value;

      return Container(
        height: screenHeight,
        width: screenWidth * 0.92,
        color: Colors.white, 
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.9),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, 
                      children: [
                        const Text("Location Details",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            )),
                        Text("Nearest Adress: ${poi!.addressInfo?.addressLine1??"Unknown"}"),
                        Text("town: ${poi.addressInfo?.town??"Unknown"}"),
                        Text("stateorprovince: ${poi.addressInfo?.stateOrProvince??"Unknown"}"),
                        Text("Poste code: ${poi.addressInfo?.postcode??"Unknown"}"),
                        Text("Country: ${poi.addressInfo?.country?.title??"Unknown"}"),
                        Text( "Lat/long: ${poi.addressInfo?.latitude.toStringAsFixed(5)??"Unknown"}/${poi.addressInfo?.longitude.toStringAsFixed(5)??"Unknown"}"),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    children: [
                      const Text(
                        "Usage Restriction",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text("operational status: ${poi.statusType!.title}"),
                      Text("usage: ${poi.usageType!.title}"),
                      Text("is operational: ${poi.statusType!.isOperational ?? "unnown"}"),
                      Text("usage cost: ${poi.UsageCost}"),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
              Container(
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    children: [
                      const Text(
                        "Network/Operator",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      Text("Made by:${poi.operatorinfo?.title??"Unknown"}"),
                      Text("WebsiteUrl : ${poi.operatorinfo?.websiteUrl??"Unknown"}"),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 15)),
              Container(
                height: poi.Connec!.length > 1
                    ? screenHeight * 0.2
                    : screenHeight * 0.11,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.9),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: poi.Connec!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          subtitle: Text(
                              "${poi.Connec![index]['Amps'] ?? "Unknown"}A  ${poi.Connec![index]['Voltage'] ?? "Unknown"}V \n${poi.Connec![index]['PowerKW'] ?? "Unknown"} kw"),
                          title: Text(
                              "${poi.Connec![index]['ConnectionType']['FormalName']}V"),
                          leading: Image(
                            width:screenWidth*0.12,
                            height: screenHeight*0.12 ,
                            image: AssetImage('assets/${poi.Connec![index]['ConnectionType']['FormalName']}.png')));
                    },
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 15)),
            ],
          ),
        ),
      );
    });
  }
}