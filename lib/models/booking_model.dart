class BookingModel {
  final String id;
  final String venueName;
  final String startTime;
  final String endTime;

  BookingModel({
    required this.id,
    required this.venueName,
    required this.startTime,
    required this.endTime,
  });

  factory BookingModel.fromJson(
      Map<String, dynamic> json) {

    return BookingModel(
      id: json['id'],
      venueName:
      json['slot']['venue']['name'],
      startTime:
      json['slot']['startTime'],
      endTime:
      json['slot']['endTime'],
    );
  }
}