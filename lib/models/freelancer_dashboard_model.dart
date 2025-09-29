



class FreelancerDashboardModel {
  final String? workStatus;
  final bool? isTodayJob;
  final FreelancerData? freelancerData;
  final HubData? hubData;

  FreelancerDashboardModel({
    this.workStatus,
    this.isTodayJob,
    this.freelancerData,
    this.hubData,
  });

  factory FreelancerDashboardModel.fromJson(Map<String, dynamic> json) => FreelancerDashboardModel(
    workStatus: json["workStatus"],
    isTodayJob: json["isTodayJob"],
    freelancerData: json["freelancerData"] == null ? null : FreelancerData.fromJson(json["freelancerData"]),
    hubData: json["hubData"] == null ? null : HubData.fromJson(json["hubData"]),
  );

  Map<String, dynamic> toJson() => {
    "workStatus": workStatus,
    "isTodayJob": isTodayJob,
    "freelancerData": freelancerData?.toJson(),
    "hubData": hubData?.toJson(),
  };
}

class FreelancerData {
  final String? id;
  final String? image;
  final String? name;
  final String? schedule;
  final String? rent;

  FreelancerData({
    this.id,
    this.image,
    this.name,
    this.schedule,
    this.rent,
  });

  factory FreelancerData.fromJson(Map<String, dynamic> json) => FreelancerData(
    id: json["_id"],
    image: json["image"],
    name: json["name"],
    schedule: json["schedule"],
    rent: json["rent"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "image": image,
    "name": name,
    "schedule": schedule,
    "rent": rent,
  };
}

class HubData {
  final String? id;
  final String? title;
  final String? category;
  final String? frequency;
  final String? location;
  final dynamic nextWorkDay;
  final String? image;

  HubData({
    this.id,
    this.title,
    this.category,
    this.frequency,
    this.location,
    this.nextWorkDay,
    this.image,
  });

  factory HubData.fromJson(Map<String, dynamic> json) => HubData(
    id: json["_id"],
    title: json["title"],
    category: json["category"],
    frequency: json["frequency"],
    location: json["location"],
    nextWorkDay: json["nextWorkDay"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "category": category,
    "frequency": frequency,
    "location": location,
    "nextWorkDay": nextWorkDay,
    "image": image,
  };
}
