class ChildInfoModel {
  bool? status;
  Parent? parent;
  List<Children>? children;

  ChildInfoModel({this.status, this.parent, this.children});

  ChildInfoModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Parent {
  int? id;
  dynamic fullName;
  dynamic genderId;
  String? telephone;
  String? telegramId;
  int? telegramBlocked;
  String? parentToken;
  String? phoneToken;
  int? phoneLink;

  Parent(
      {this.id,
        this.fullName,
        this.genderId,
        this.telephone,
        this.telegramId,
        this.telegramBlocked,
        this.parentToken,
        this.phoneToken,
        this.phoneLink});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    genderId = json['gender_id'];
    telephone = json['telephone'];
    telegramId = json['telegram_id'];
    telegramBlocked = json['telegram_blocked'];
    parentToken = json['parent_token'];
    phoneToken = json['phone_token'];
    phoneLink = json['phone_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['gender_id'] = this.genderId;
    data['telephone'] = this.telephone;
    data['telegram_id'] = this.telegramId;
    data['telegram_blocked'] = this.telegramBlocked;
    data['parent_token'] = this.parentToken;
    data['phone_token'] = this.phoneToken;
    data['phone_link'] = this.phoneLink;
    return data;
  }
}

class Children {
  String? id;
  String? fullName;
  String? image;
  String? thumbImage;

  Children({this.id, this.fullName, this.image, this.thumbImage});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    image = json['image'];
    thumbImage = json['thumb_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['image'] = this.image;
    data['thumb_image'] = this.thumbImage;
    return data;
  }
}