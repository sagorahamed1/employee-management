



class JoinRequestModel {
  final String? applicationId;
  final String? userId;
  final String? name;
  final String? address;
  final String? image;
  final String? status;

  JoinRequestModel({
    this.applicationId,
    this.userId,
    this.name,
    this.address,
    this.image,
    this.status,
  });

  factory JoinRequestModel.fromJson(Map<String, dynamic> json) => JoinRequestModel(
    applicationId: json["application_id"],
    userId: json["user_id"],
    name: json["name"],
    address: json["address"],
    image: json["image"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "application_id": applicationId,
    "user_id": userId,
    "name": name,
    "address": address,
    "image": image,
    "status": status,
  };
}
