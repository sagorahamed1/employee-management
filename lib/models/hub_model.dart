

class HubModel {
  final String? id;
  final String? image;
  final String? hubName;
  final String? taskTitle;
  final String? taskCategory;
  final int? pepoleJoined;
  final String? organizer;
   bool? isJoined;
  final DateTime? createdAt;

  HubModel({
    this.id,
    this.image,
    this.hubName,
    this.taskTitle,
    this.taskCategory,
    this.pepoleJoined,
    this.organizer,
    this.isJoined,
    this.createdAt,
  });

  factory HubModel.fromJson(Map<String, dynamic> json) => HubModel(
    id: json["_id"],
    image: json["image"],
    hubName: json["hubName"],
    taskTitle: json["task_title"],
    taskCategory: json["task_category"],
    pepoleJoined: json["pepole_joined"],
    organizer: json["organizer"],
    isJoined: json["isJoined"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "hubName": hubName,
    "task_title": taskTitle,
    "task_category": taskCategory,
    "pepole_joined": pepoleJoined,
    "organizer": organizer,
    "isJoined": isJoined,
    "createdAt": createdAt?.toIso8601String(),
  };
}
