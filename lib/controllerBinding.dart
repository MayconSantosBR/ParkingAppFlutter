import 'package:get/get.dart';
import 'controllers/parking_controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ParkingController>(() => ParkingController());
  }
}
