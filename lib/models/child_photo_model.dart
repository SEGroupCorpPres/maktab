class ChildPhotoModel {
  bool? status;
  Pupil? pupil;
  List<ComeOuts>? comeOuts;
  Balance? balance;
  PayLink? payLink;

  ChildPhotoModel(
      {this.status, this.pupil, this.comeOuts, this.balance, this.payLink});

  ChildPhotoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    pupil = json['pupil'] != null ? new Pupil.fromJson(json['pupil']) : null;
    if (json['come_outs'] != null) {
      comeOuts = <ComeOuts>[];
      json['come_outs'].forEach((v) {
        comeOuts!.add(new ComeOuts.fromJson(v));
      });
    }
    balance =
    json['balance'] != null ? new Balance.fromJson(json['balance']) : null;
    payLink = json['pay_link'] != null
        ? new PayLink.fromJson(json['pay_link'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.pupil != null) {
      data['pupil'] = this.pupil!.toJson();
    }
    if (this.comeOuts != null) {
      data['come_outs'] = this.comeOuts!.map((v) => v.toJson()).toList();
    }
    if (this.balance != null) {
      data['balance'] = this.balance!.toJson();
    }
    if (this.payLink != null) {
      data['pay_link'] = this.payLink!.toJson();
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

class Balance {
  dynamic sum;

  Balance({this.sum});

  Balance.fromJson(Map<String, dynamic> json) {
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sum'] = this.sum;
    return data;
  }
}

class PayLink {
  String? link;

  PayLink({this.link});

  PayLink.fromJson(Map<String, dynamic> json) {
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    return data;
  }
}