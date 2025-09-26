




class ApplicationModel {
  final String? id;
  final String? serviceTittle;
  final String? category;
  final String? timeSlot;
  final String? location;
  final String? freelancer;

  ApplicationModel({
    this.id,
    this.serviceTittle,
    this.category,
    this.timeSlot,
    this.location,
    this.freelancer,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) => ApplicationModel(
    id: json["_id"],
    serviceTittle: json["serviceTittle"],
    category: json["category"],
    timeSlot: json["timeSlot"],
    location: json["location"],
    freelancer: json["freelancer"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceTittle": serviceTittle,
    "category": category,
    "timeSlot": timeSlot,
    "location": location,
    "freelancer": freelancer,
  };
}
