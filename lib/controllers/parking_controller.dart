import 'package:get/get.dart';
import '../models/parking_model.dart';
import '../services/ParkingStop.dart';

class ParkingController extends GetxController {
  ParkingSpotService parkingSpotService = ParkingSpotService();
  var isLoading = false.obs;
  var listParkingSpotObs = <ParkingModel>[].obs;

  static ParkingController get parkingController => Get.find();

  Future<dynamic> listParking() async {
    isLoading.value = true;
    var list = await parkingSpotService.listOfParkings();
    listParkingSpotObs.value = list.listParkingSpotModel;
    isLoading.value = false;
    update();
    return listParkingSpotObs;
  }

  Future<dynamic> post(ParkingModel objeto) async {
    isLoading.value = true;
    var response = await parkingSpotService.postGarage(objeto);
    isLoading.value = false;
    update();
    return response;
  }

  Future<dynamic> deleteParking(ParkingModel objeto) async {
    isLoading.value = true;
    var response = await parkingSpotService.deleteGarage(objeto);
    isLoading.value = false;
    update();
    return response;
  }

  Future<dynamic> editParking(ParkingModel objeto) async {
    isLoading.value = true;
    var response = await parkingSpotService.editGarage(objeto);
    isLoading.value = false;
    update();
    return response;
  }
}
