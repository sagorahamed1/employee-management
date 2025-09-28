

import 'package:get/get.dart';

class PollModel {
  final String? freelancerId;
  final int? fee;
  final String? taskType;
  final String? freelancer;
  final String? serviceTitle;
  final String? image;
  final int? totalVote;
  final String? timeSlot;
   bool? isVoted;

  PollModel({
    this.freelancerId,
    this.fee,
    this.taskType,
    this.freelancer,
    this.serviceTitle,
    this.image,
    this.totalVote,
    this.timeSlot,
    this.isVoted,
  });

  factory PollModel.fromJson(Map<String, dynamic> json) => PollModel(
    freelancerId: json["freelancerId"],
    fee: json["fee"],
    taskType: json["taskType"],
    freelancer: json["freelancer"],
    serviceTitle: json["serviceTitle"],
    image: json["image"],
    totalVote: json["totalVote"],
    timeSlot: json["timeSlot"],
    isVoted: json["isVoted"],
  );

  Map<String, dynamic> toJson() => {
    "freelancerId": freelancerId,
    "fee": fee,
    "taskType": taskType,
    "freelancer": freelancer,
    "serviceTitle": serviceTitle,
    "image": image,
    "totalVote": totalVote,
    "timeSlot": timeSlot,
    "isVoted": isVoted,
  };
}
