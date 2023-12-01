import 'package:flutter/material.dart';
import '../components/header_component.dart';
import '../components/menu_component.dart';
import 'package:get/get.dart';
import '../controllers/parking_controller.dart';
import 'edit_screen.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({super.key});

  @override
  State<ListaPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  var controller = ParkingController.parkingController;

  @override
  void initState() {
    super.initState();
    controller.listParking();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HeaderComponent(context),
        drawer: MenuComponent(context),
        body: Obx(
          () => controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.listParkingSpotObs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          Text(controller.listParkingSpotObs[index].carPlate),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              Get.to(Edit(
                                  object:
                                      controller.listParkingSpotObs[index]));
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () async {
                              var response = await controller.deleteParking(
                                  controller.listParkingSpotObs[index]);
                              if (response != false) {
                                Get.snackbar("Sucesso", "Deletado!");
                                await controller.listParking();
                              } else {
                                Get.snackbar(
                                    "Erro", "Ocorreu um erro ao deletar");
                              }
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ));
  }
}
