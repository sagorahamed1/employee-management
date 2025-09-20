



class ServiceDetailsModel {
  final String? id;
  final String? taskCategory;
  final List<String>? taskList;
  final String? image;
  final String? description;
  final bool? isDeleted;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  ServiceDetailsModel({
    this.id,
    this.taskCategory,
    this.taskList,
    this.image,
    this.description,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ServiceDetailsModel.fromJson(Map<String, dynamic> json) => ServiceDetailsModel(
    id: json["_id"],
    taskCategory: json["taskCategory"],
    taskList: json["taskList"] == null ? [] : List<String>.from(json["taskList"]!.map((x) => x)),
    image: json["image"],
    description: json["description"],
    isDeleted: json["isDeleted"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "taskCategory": taskCategory,
    "taskList": taskList == null ? [] : List<dynamic>.from(taskList!.map((x) => x)),
    "image": image,
    "description": description,
    "isDeleted": isDeleted,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
