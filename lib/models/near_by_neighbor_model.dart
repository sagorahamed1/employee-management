



class NearByNeighborModel {
  final String? id;
  final String? name;
  final String? image;
  final String? email;

  NearByNeighborModel({
    this.id,
    this.name,
    this.image,
    this.email,
  });

  factory NearByNeighborModel.fromJson(Map<String, dynamic> json) => NearByNeighborModel(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "email": email,
  };
}


