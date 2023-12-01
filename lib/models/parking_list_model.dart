import 'parking_model.dart';

class ParkingList {
  final List<ParkingModel> listParkingSpotModel;

  ParkingList(this.listParkingSpotModel);

  ParkingList.fromJson(List<dynamic> json)
      : listParkingSpotModel =
            List.from(json).map((item) => ParkingModel.fromJson(item)).toList();
}
