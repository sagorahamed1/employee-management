



class ApplicationModel {
  final String? id;
  final String? freelancerId;
  final String? serviceTittle;
  final String? category;
  final String? timeSlot;
  final String? description;
  final String? location;
  final int? fee;
  final String? image;
  final String? freelancer;
  final int? rating;

  ApplicationModel({
    this.id,
    this.freelancerId,
    this.serviceTittle,
    this.category,
    this.timeSlot,
    this.description,
    this.location,
    this.fee,
    this.image,
    this.freelancer,
    this.rating,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => ApplicationModel(
    id: json["_id"],
    freelancerId: json["freelancer_id"],
    serviceTittle: json["serviceTittle"],
    category: json["category"],
    timeSlot: json["timeSlot"],
    description: json["description"],
    location: json["location"],
    fee: json["fee"],
    image: json["image"],
    freelancer: json["freelancer"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "freelancer_id": freelancerId,
    "serviceTittle": serviceTittle,
    "category": category,
    "timeSlot": timeSlot,
    "description": description,
    "location": location,
    "fee": fee,
    "image": image,
    "freelancer": freelancer,
    "rating": rating,
  };
}
