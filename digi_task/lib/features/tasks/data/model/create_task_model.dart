class CreateTaskModel {
  String? taskType;
  String? description;
  String? registrationNumber;
  String? contactNumber;
  String? location;
  String? note;
  String? date;
  String? time;
  String? status;
  bool? isVoice;
  bool? isInternet;
  bool? isTv;
  int? user;
  List<int>? group;

  CreateTaskModel(
      {this.taskType,
      this.description,
      this.registrationNumber,
      this.contactNumber,
      this.location,
      this.note,
      this.date,
      this.time,
      this.status,
      this.isVoice,
      this.isInternet,
      this.isTv,
      this.user,
      this.group});

  CreateTaskModel.fromJson(Map<String, dynamic> json) {
    taskType = json['task_type'];
    description = json['description'];
    registrationNumber = json['registration_number'];
    contactNumber = json['contact_number'];
    location = json['location'];
    note = json['note'];
    date = json['date'];
    time = json['time'];
    status = json['status'];
    isVoice = json['is_voice'];
    isInternet = json['is_internet'];
    isTv = json['is_tv'];
    user = json['user'];
    if (json['group'] != null) {
      group = <int>[];
      json['group'].forEach((v) {
        group!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['task_type'] = taskType;
    data['description'] = description;
    data['registration_number'] = registrationNumber;
    data['contact_number'] = contactNumber;
    data['location'] = location;
    data['note'] = note;
    data['date'] = date;
    data['time'] = time;
    data['status'] = status;
    data['is_voice'] = isVoice;
    data['is_internet'] = isInternet;
    data['is_tv'] = isTv;
    data['user'] = user;
    if (group != null) {
      data['group'] = group!.map((v) => v).toList();
    }
    return data;
  }
}
