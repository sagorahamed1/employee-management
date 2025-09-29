



class ChatModel {
  final String? id;
  final String? senderName;
  final String? senderImage;
  final String? senderId;
  final String? message;
  final String? file;
  final String? messageType;
  final DateTime? createdAt;

  ChatModel({
    this.id,
    this.senderName,
    this.senderImage,
    this.senderId,
    this.message,
    this.file,
    this.messageType,
    this.createdAt,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    id: json["_id"],
    senderName: json["senderName"],
    senderImage: json["senderImage"],
    senderId: json["senderId"],
    message: json["message"],
    file: json["file"],
    messageType: json["messageType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "senderName": senderName,
    "senderImage": senderImage,
    "senderId": senderId,
    "message": message,
    "file": file,
    "messageType": messageType,
    "createdAt": createdAt?.toIso8601String(),
  };
}
