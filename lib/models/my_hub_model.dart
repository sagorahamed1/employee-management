

class MyHubModel {
  final String? id;
  final String? hubName;
  final String? task;
  final String? image;
  final int? neighborCount;

  MyHubModel({
    this.id,
    this.hubName,
    this.task,
    this.image,
    this.neighborCount,
  });

  factory MyHubModel.fromJson(Map<String, dynamic> json) => MyHubModel(
    id: json["_id"],
    hubName: json["hubName"],
    task: json["task"],
    image: json["image"],
    neighborCount: json["neighborCount"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "hubName": hubName,
    "task": task,
    "image": image,
    "neighborCount": neighborCount,
  };
}
