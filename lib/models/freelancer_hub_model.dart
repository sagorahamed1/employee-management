





class FreelancerHubModel {
  final String? id;
  final String? image;
  final String? hubName;
  final String? taskTitle;
  final String? taskCategory;
  final int? pepoleJoined;
  final String? organizer;
  final bool? isApplyed;
  final DateTime? createdAt;

  FreelancerHubModel({
    this.id,
    this.image,
    this.hubName,
    this.taskTitle,
    this.taskCategory,
    this.pepoleJoined,
    this.organizer,
    this.isApplyed,
    this.createdAt,
  });

  factory FreelancerHubModel.fromJson(Map<String, dynamic> json) => FreelancerHubModel(
    id: json["_id"],
    image: json["image"],
    hubName: json["hubName"],
    taskTitle: json["task_title"],
    taskCategory: json["task_category"],
    pepoleJoined: json["pepole_joined"],
    organizer: json["organizer"],
    isApplyed: json["isApplyed"],
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
    "isApplyed": isApplyed,
    "createdAt": createdAt?.toIso8601String(),
  };
}
