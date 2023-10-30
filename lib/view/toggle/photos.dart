import 'package:evchstation/controller/Auth/authcontroller.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Photos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final PoiDetailsController poiController = Get.find();
    final Poi? poi = poiController.poi.value;

   
    return Container(
      height: screenHeight,
      width: screenWidth * 0.92,
      color: Colors.white, 
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.7,
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
                padding: const EdgeInsets.all(8.0),
                child: poi?.Media != null && poi!.Media![0] != "No Photos"

                    ?ListView.builder(
                        shrinkWrap: true,
                        itemCount:poi.Media!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String user =poi.usercomment?[0].userName??"Unknown";
                          final String desciption =poi.Media![index]['Comment'].toString();
                          final String imageurl =poi.Media![index]['ItemURL'].toString();
                          DateFormat dateFormat = DateFormat("dd/MM/yyyy");
                          String formattedDate = dateFormat.format(
                              DateTime.parse(poi.Media![index]['DateCreated']));
                          return ListTile(
                            leading: Text("$user \n \n$formattedDate"),
                            title: Image.network(imageurl),
                            subtitle: Text("$desciption\n \n"),
                          );
                        },
                      )
                     
                    : const Center(
                        child: Text("No photos"),
                      ),
              ),
            )
          ],
        ),
      ),
    );
 
  }
}