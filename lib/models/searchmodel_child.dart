class ChildSearchModel {
  bool? status;
  Pupil? pupil;
  List<ComeOuts>? comeOuts;

  ChildSearchModel({this.status, this.pupil, this.comeOuts});

  ChildSearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pupil = json['pupil'] != null ? new Pupil.fromJson(json['pupil']) : null;
    if (json['come_outs'] != null) {
      comeOuts = <ComeOuts>[];
      json['come_outs'].forEach((v) {
        comeOuts!.add(new ComeOuts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.pupil != null) {
      data['pupil'] = this.pupil!.toJson();
    }
    if (this.comeOuts != null) {
      data['come_outs'] = this.comeOuts?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pupil {
  String? school;
  String? fullName;
  String? grade;
  String? thumbImage;
  String? teacherName;
  String? secretId;

  Pupil(
      {this.school,
        this.fullName,
        this.grade,
        this.thumbImage,
        this.teacherName,
        this.secretId});

  Pupil.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    fullName = json['full_name'];
    grade = json['grade'];
    thumbImage = json['thumb_image'];
    teacherName = json['teacher_name'];
    secretId = json['secret_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['school'] = this.school;
    data['full_name'] = this.fullName;
    data['grade'] = this.grade;
    data['thumb_image'] = this.thumbImage;
    data['teacher_name'] = this.teacherName;
    data['secret_id'] = this.secretId;
    return data;
  }
}

class ComeOuts {
  String? id;
  String? come;
  String? time;
  String? photo;

  ComeOuts({this.id, this.come, this.time, this.photo});

  ComeOuts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    come = json['come'];
    time = json['time'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['come'] = this.come;
    data['time'] = this.time;
    data['photo'] = this.photo;
    return data;
  }
}