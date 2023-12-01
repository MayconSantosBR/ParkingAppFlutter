import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/header_component.dart';
import '../components/menu_component.dart';
import '../controllers/parking_controller.dart';
import '../models/parking_model.dart';

class Edit extends StatefulWidget {
  const Edit({Key? key, required this.object}) : super(key: key);

  final ParkingModel object;

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<Edit> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final parkingNumberController = TextEditingController();
    final carPlateController = TextEditingController();
    final brandController = TextEditingController();
    final modelController = TextEditingController();
    final colorController = TextEditingController();
    final responsibleController = TextEditingController();
    final apartController = TextEditingController();
    final blockController = TextEditingController();

    parkingNumberController.text = widget.object.parkingNumber;
    carPlateController.text = widget.object.carPlate;
    brandController.text = widget.object.brandCar;
    modelController.text = widget.object.modelCar;
    colorController.text = widget.object.colorCar;
    responsibleController.text = widget.object.responsible;
    apartController.text = widget.object.apart;
    blockController.text = widget.object.block;

    var controller = ParkingController.parkingController;

    String? validateFields(String value) {
      if (value.isEmpty) {
        return 'Insira alguma informação';
      }
      return null;
    }

    void submit() async {
      ParkingModel parkingSpot = ParkingModel(
          widget.object.id,
          parkingNumberController.text,
          carPlateController.text,
          brandController.text,
          modelController.text,
          colorController.text,
          "",
          responsibleController.text,
          apartController.text,
          blockController.text);

      var response = await controller.editParking(parkingSpot);

      if (response != false) {
        Get.snackbar(
          "Sucesso",
          "Salvo com Sucesso",
          icon: const Icon(Icons.check, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.lightGreen,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar("Houve um erro", response,
            icon: const Icon(Icons.error, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: HeaderComponent(context),
      drawer: MenuComponent(context),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.numbers),
                          labelText: 'Número da vaga',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: parkingNumberController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.signpost),
                          labelText: 'Número da placa',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: carPlateController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.branding_watermark),
                          labelText: 'Marca do carro',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: brandController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.car_rental),
                          labelText: 'Modelo do carro',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: modelController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.color_lens),
                          labelText: 'Cor do carro',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: colorController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        labelText: 'Nome do responsável',
                        alignLabelWithHint: true,
                        focusColor: Colors.lightGreen,
                        fillColor: Colors.lightGreen,
                      ),
                      validator: (value) => validateFields(value!),
                      controller: responsibleController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.home),
                          labelText: 'Apartamento',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: apartController,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          icon: Icon(Icons.home),
                          labelText: 'Bloco',
                          alignLabelWithHint: true,
                          focusColor: Colors.lightGreen,
                          fillColor: Colors.lightGreen),
                      validator: (value) => validateFields(value!),
                      controller: blockController,
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: submit,
                      child: const Text('Enviar'),
                    )
                  ],
                ),
              ))),
    );
  }
}
