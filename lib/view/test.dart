import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  // Liste de données
  var dataList = [].obs;

  // Méthode pour mettre à jour la liste de données
  void updateData() {
    // Simulons une récupération de données à partir d'une API ou d'une autre source
    List newData = fetchDataFromAPI();
    
    // Mettez à jour la liste de données
    dataList.assignAll(newData);
    
    // Mettez à jour l'interface utilisateur en appelant update()
    update();
  }

  // Fonction de simulation pour récupérer des données de l'API
  List fetchDataFromAPI() {
    return ['Item 1', 'Item 2', 'Item 3']; // Remplacez ceci par votre logique de récupération de données réelle
  }
}

class MyPage extends StatelessWidget {
  // Contrôleur pour gérer les données
  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Update Example'),
      ),
      body: Center(
        child: GetBuilder<DataController>(
          builder: (controller) {
            // Affichez la liste de données
            return ListView.builder(
              itemCount: controller.dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.dataList[index]),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lorsque le bouton est pressé, mettez à jour les données en appelant la méthode dans le contrôleur
          dataController.updateData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

void main() => runApp(GetMaterialApp(home: MyPage()));
