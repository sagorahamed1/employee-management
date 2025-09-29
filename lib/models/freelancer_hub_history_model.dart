

class FreelancerHubHistoryModel {
  final String? id;
  final String? hubId;
  final String? image;
  final String? hubName;
  final String? taskTitle;
  final int? fee;
  final String? status;
  final String? location;
  final String? timeSlot;

  FreelancerHubHistoryModel({
    this.id,
    this.hubId,
    this.image,
    this.hubName,
    this.taskTitle,
    this.fee,
    this.status,
    this.location,
    this.timeSlot,
  });

  factory FreelancerHubHistoryModel.fromJson(Map<String, dynamic> json) => FreelancerHubHistoryModel(
    id: json["_id"],
    hubId: json["hubId"],
    image: json["image"],
    hubName: json["hubName"],
    taskTitle: json["task_title"],
    fee: json["fee"],
    status: json["status"],
    location: json["location"],
    timeSlot: json["timeSlot"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "hubId": hubId,
    "image": image,
    "hubName": hubName,
    "task_title": taskTitle,
    "fee": fee,
    "status": status,
    "location": location,
    "timeSlot": timeSlot,
  };
}
