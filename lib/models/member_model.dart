

class MemberModel {
  final String? userId;
  final String? name;
  final String? image;
  final String? address;

  MemberModel({
    this.userId,
    this.name,
    this.image,
    this.address,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
    userId: json["user_id"],
    name: json["name"],
    image: json["image"],
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "name": name,
    "image": image,
    "address": address,
  };
}
