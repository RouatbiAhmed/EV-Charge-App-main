import 'package:evchstation/controller/arguments.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ToggleSwitchExample extends StatelessWidget {
  final RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Obx(() => CupertinoSlidingSegmentedControl<int>(
            groupValue: currentIndex.value,
            onValueChanged: (value) {
              currentIndex.value = value!;
            },
            children: {
              0: Text('Details'),
              1: Text('Comments'),
              2: Text('Photos'),
            },
          ),
        ),
        Obx(
          () => IndexedStack(
            index: currentIndex.value,
            children: [
              Widget1(), 
              Widget2(), 
              Widget3(), 
            ],
          ),
        ),
      ],
    );
  }
}

class Widget3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Arguments arg = Get.arguments;

    return Container(
      height: screenHeight,
      width: screenWidth * 0.92,
      color: Colors.white, //pink
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
                child: arg.media[0] != "No Photos"
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: arg.media.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String user =arg.media[index]['User']['Username'].toString();
                          final String desciption =arg.media[index]['Comment'].toString();
                          final String imageurl =arg.media[index]['ItemURL'].toString();
                          DateFormat dateFormat = DateFormat("dd/MM/yyyy");
                          String formattedDate = dateFormat.format(DateTime.parse(arg.media[index]['DateCreated']));
                          return ListTile(
                            leading: Text("${user} \n \n$formattedDate"),
                            title: Image.network(imageurl),
                            subtitle: Text("$desciption\n \n"),
                          );
                        },
                      )
                    :const Center(child: Text("No photos"),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final Arguments arg = Get.arguments;

    return Container(
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (arg.usercomment.length!=0)
            // if (arg.usercomment[0] != "NO comments")
              ListView.builder(
                shrinkWrap: true,
                itemCount: arg.usercomment.length,
                itemBuilder: (BuildContext context, int index) {
              
                  final String? commentText =arg.usercomment[index].comment;
                  final String? userName = arg.usercomment[index].userName;
                  final bool isPositive =arg.usercomment[index].checkinStatusType?.isPositive == true?true:false;
                  /*
                     final comment = arg.usercomment[index];
                  final String commentText = comment['Comment'].toString();
                  final String userName = comment['UserName'].toString();
                  final bool isPositive =comment['CheckinStatusType']['IsPositive'];
                  */
                  return ListTile(
                    title: Text(commentText!),
                    subtitle: Text(userName!),
                    leading:isPositive ? const Icon(Icons.done,color:Colors.green,) :const Icon(Icons.dangerous,color:Colors.red,),
                  );
                },
              )
            else
             const Center(child: Text("No comments"),
              ),
          ],
        ),
      ),
    );
  }
}

class Widget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Arguments arg = Get.arguments;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      width: screenWidth * 0.92,
      color: Colors.white, //pink
      child: SingleChildScrollView(
        child: Column(
          // Remplacez le ListView par une Column
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
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize
                        .min, // Utilisez MainAxisSize.min pour adapter la hauteur au contenu
                    children: [
                      const Text("Location Details",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 15,
                          )),
                      Text("Nearest Adress: ${arg.addressinfo.addressLine1}"),
                      Text("town: ${arg.addressinfo.town}"),
                      Text("stateorprovince: ${arg.addressinfo.stateOrProvince}"),
                      Text("Poste code: ${arg.addressinfo.postcode}"),
                      Text("Country: ${arg.addressinfo.country?.title}"),
                      Text("Lat/long: ${arg.addressinfo.latitude.toStringAsFixed(5)}/${arg.addressinfo.longitude.toStringAsFixed(5)}"),
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
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  children: [
                  const  Text(
                      "Usage Restriction",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    Text("operational status: ${arg.statustypetitle}"),
                    Text("usage: ${arg.usagetypetitle}"),
                    Text(
                        "is operational: ${arg.statustype!.isOperational ?? "unnown"}"),
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
                  const  Text(
                      "Network/Operator",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    Text("Made by:${arg.operatorinfo.title}"),
                    Text("WebsiteUrl : ${arg.operatorinfo.websiteUrl}"),
                  ],
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 15)),
            Container(
              height: arg.connection.length > 1
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
                  itemCount: arg.connection.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        subtitle: Text(
                            "${arg.connection[index]['Amps'] ?? "Unknown"}A  ${arg.connection[index]['Voltage'] ?? "Unknown"}V \n${arg.connection[index]['PowerKW'] ?? "Unknown"} kw"),
                        title: Text(
                            "${arg.connection[index]['ConnectionType']['FormalName']}V"),
                        leading: Image(
                            image: AssetImage(
                                'assets/${arg.connection[index]['ConnectionType']['FormalName']}.png')));
                  },
                ),
              ),
            ),
            /*  Container(
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
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: arg.connection.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            subtitle: Text("${arg.connection[index]['Amps']??"-"}A  ${arg.connection[index]['Voltage']??"-"}V \n${arg.connection[index]['PowerKW']??"Unknown"} kw"),
                            
                            title: Text("${arg.connection[index]['ConnectionType']['FormalName']}V"),
                          
                            leading: Image(image: AssetImage('assets/${arg.connection[index]['ConnectionType']['FormalName']}.png'))
                            );
                      },
                    ),
                  ),
                ),
              ),
            ),*/
            Padding(padding: EdgeInsets.only(bottom: 15)),
          ],
        ),
      ),
    );
  }
}
