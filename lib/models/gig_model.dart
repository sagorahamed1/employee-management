

class GigModel {
  final String? userId;
  final String? description;
  final String? name;
  final String? image;
  final String? location;
  final int? fee;
  final String? serviceType;
  final String? category;
  final int? rating;
  final String? timeSlot;

  GigModel({
    this.userId,
    this.description,
    this.name,
    this.image,
    this.location,
    this.fee,
    this.serviceType,
    this.category,
    this.rating,
    this.timeSlot,
  });

  factory GigModel.fromJson(Map<String, dynamic> json) => GigModel(
    userId: json["userId"],
    description: json["description"],
    name: json["name"],
    image: json["image"],
    location: json["location"],
    fee: json["fee"],
    serviceType: json["serviceType"],
    category: json["category"],
    rating: json["rating"],
    timeSlot: json["timeSlot"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "description": description,
    "name": name,
    "image": image,
    "location": location,
    "fee": fee,
    "serviceType": serviceType,
    "category": category,
    "rating": rating,
    "timeSlot": timeSlot,
  };
}
