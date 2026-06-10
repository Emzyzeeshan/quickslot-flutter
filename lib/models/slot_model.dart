class SlotModel {
  final String id;
  final String startTime;
  final String endTime;
  final bool available;

  SlotModel({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.available,
  });

  factory SlotModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return SlotModel(
      id: json['id'],
      startTime: json['startTime'],
      endTime: json['endTime'],
      available: json['available'],
    );
  }
}