class ParkingModel {
  final String id;
  final String parkingNumber;
  final String carPlate;
  final String brandCar;
  final String modelCar;
  final String colorCar;
  final String registrationDate;
  final String responsible;
  final String apart;
  final String block;

  ParkingModel(
      this.id,
      this.parkingNumber,
      this.carPlate,
      this.brandCar,
      this.modelCar,
      this.colorCar,
      this.registrationDate,
      this.responsible,
      this.apart,
      this.block);

  ParkingModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        parkingNumber = json['parkingSpotNumber'],
        carPlate = json['licensePlateCar'],
        brandCar = json['brandCar'],
        modelCar = json['modelCar'],
        colorCar = json['colorCar'],
        registrationDate = json['registrationDate'],
        responsible = json['responsibleName'],
        apart = json['apartment'],
        block = json['block'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'parkingSpotNumber': parkingNumber,
        'licensePlateCar': carPlate,
        'brandCar': brandCar,
        'modelCar': modelCar,
        'colorCar': colorCar,
        'registrationDate': registrationDate,
        'responsibleName': responsible,
        'apartment': apart,
        'block': block,
      };
}
