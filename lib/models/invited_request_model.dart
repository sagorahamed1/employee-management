



class InvitedRequestModel {
  final String? id;
  final String? image;
  final String? hubName;
  final String? message;

  InvitedRequestModel({
    this.id,
    this.image,
    this.hubName,
    this.message,
  });

  factory InvitedRequestModel.fromJson(Map<String, dynamic> json) => InvitedRequestModel(
    id: json["_id"],
    image: json["image"],
    hubName: json["hubName"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "hubName": hubName,
    "message": message,
  };
}
