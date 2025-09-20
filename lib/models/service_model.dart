

class ServiceModel {
  final String? id;
  final String? taskCategory;
  final List<String>? taskList;
  final String? description;
  final String? image;

  ServiceModel({
    this.id,
    this.taskCategory,
    this.taskList,
    this.description,
    this.image,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) => ServiceModel(
    id: json["_id"],
    taskCategory: json["taskCategory"],
    taskList: json["taskList"] == null ? [] : List<String>.from(json["taskList"]!.map((x) => x)),
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "taskCategory": taskCategory,
    "taskList": taskList == null ? [] : List<dynamic>.from(taskList!.map((x) => x)),
    "description": description,
    "image": image,
  };
}
