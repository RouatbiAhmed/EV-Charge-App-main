import 'package:evchstation/controller/poidetailscontroller.dart';
import 'package:evchstation/models/poi/poi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final PoiDetailsController poiController = Get.find();

    return Obx(() {
      final Poi? poi = poiController.poi.value;
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
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (poi != null &&
                  poi.usercomment != null &&
                  poi.usercomment!.isNotEmpty)

                ListView.builder(
                  shrinkWrap: true,
                  itemCount: poi.usercomment!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String commentText = poi.usercomment?[index].comment??"No comment found !";
                    final String userName = poi.usercomment?[index].userName??"Unknown";
                    final bool isPositive =poi.usercomment![index].checkinStatusType?.isPositive ==true? true: false;

                    return ListTile(
                      title: Text(commentText),
                      subtitle: Text(userName),
                      leading: isPositive
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.dangerous,
                              color: Colors.red,
                            ),
                    );
                  },
                )
              else
                const Center(
                  child: Text("No comments"),
                ),
            ],
          ),
        ),
      );
    });
  }
}
