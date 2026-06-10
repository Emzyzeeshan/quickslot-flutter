class VenueModel {
  final String id;
  final String name;
  final String location;
  final String sportType;

  VenueModel({
    required this.id,
    required this.name,
    required this.location,
    required this.sportType,
  });

  factory VenueModel.fromJson(
      Map<String, dynamic> json,
      ) {
    return VenueModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      sportType: json['sportType'],
    );
  }
}