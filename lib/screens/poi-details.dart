import 'package:evchstation/controller/arguments.dart';
import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/screens/toggle/addcomment.dart';
import 'package:evchstation/screens/toggle/toggle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'toggle/addphoto.dart';

class PoiDetails extends StatelessWidget {
  PoiDetails({super.key});
  // ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  final fabController = Get.put(PoiDetailsController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Arguments arg = Get.arguments;

    return Scaffold(
      body:SafeArea(
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
                              if (arg.media[0] != "No Photos")
                                // Container pour l'image en arrière-plan
                                Container(
                                  height: screenHeight * 0.2,
                                  width: screenWidth,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(arg.media[0]
                                              ['ItemURL']
                                          .toString()), // Utilisez NetworkImage avec l'URL de l'image
                                      fit: BoxFit.cover, // Ajuste l'image pour remplir le conteneur
                                    ),
                                  ),
                                )
                              else
                                Container(
                                  height: screenHeight * 0.2,
                                  width: screenWidth,
                                  color:Color(0xFF28AAB1),
                                ),

                              // Container pour le contenu textuel
                              Container(
                                height: screenHeight * 0.2,
                                width: screenWidth,
                                // color: Color.fromARGB(255, 173, 22, 128).withOpacity(0.7), // Couleur de fond avec opacité
                                child: /* Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: arg.connection.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ListTile(
                                        title: Text(
                                          "Charge Station ${arg.addressinfo.title}\n OCM-${arg.id}\n ${arg.connection[0]['ConnectionType']['Title']}",
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      );
                                    },
                                  ),
                                ),*/

                                    Padding(
                                  padding: const EdgeInsets.only(top: 22),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Charge Station ${arg.addressinfo.title}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "OCM-${arg.id}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "${arg.connection[0]['ConnectionType']['Title']}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text(
                                        "${arg.operatorinfo.title}",
                                        style: TextStyle(color: Colors.white),
                                      )

                                      /*Text("Made by: ${arg.opinf['Title']??"Unknown"} " ,
                                        //"Made by: ${arg.operatorname}",
                                        style: TextStyle(color: Colors.white),
                                      ),*/
                                      /*Text(
                                        "Nombre de connecteur : ${arg.connectiontitle}",
                                        style: TextStyle(color: Colors.white),
                                      ),*/
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
                        child: ToggleSwitchExample()),
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
                                  SizedBox(height: 16),
                                  // Espacement entre les boutons
                                  FloatingActionButton(
                                    heroTag: "openandclose",
                                    onPressed: () {
                                      fabController.toggleExpanded();
                                    },
                                    child: Icon(fabController.isExpanded.value
                                        ? Icons.close
                                        : Icons.add),
                                  ),
                                  const SizedBox(height: 16),
                                  Visibility(
                                    visible: fabController.isExpanded.value,
                                    child: FloatingActionButton(
                                      heroTag: "addphoto",
                                      onPressed: () {
                                        // Action 1
                                        Get.to(AddPhoto(),arguments: Arguments(addressinfo: arg.addressinfo, operatorinfo: arg.operatorinfo, statustype: arg.statustype, id: arg.id, statustypetitle: arg.statustypetitle, usagetypetitle: arg.usagetypetitle, numberofpoints: arg.numberofpoints, usercomment: arg.usercomment, connection: arg.connection, media: arg.media));
                                      },
                                      child: Icon(Icons.image),
                                    ),
                                  ),
                                  const SizedBox(height:16), // Espacement entre les boutons
                                  Visibility(
                                    visible: fabController.isExpanded.value,
                                    child: FloatingActionButton(
                                      heroTag: "addcomment",
                                      onPressed: () {
                                        Get.to(AddComment(),arguments: Arguments(addressinfo: arg.addressinfo, operatorinfo: arg.operatorinfo, statustype: arg.statustype, id: arg.id, statustypetitle: arg.statustypetitle, usagetypetitle: arg.usagetypetitle, numberofpoints: arg.numberofpoints, usercomment: arg.usercomment, connection: arg.connection, media: arg.media));
                                      },
                                      child:const Icon(Icons.comment),
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
      ),
    );
  }
}