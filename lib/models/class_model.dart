class SinfModel {
  bool? status;
  List<Data>? data;

  SinfModel({this.status, this.data});

  SinfModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? nameUz;
  String? nameRu;
  String? type;
  String? fileUz;
  String? fileRu;

  Data(
      {this.id, this.nameUz, this.nameRu, this.type, this.fileUz, this.fileRu});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    type = json['type'];
    fileUz = json['file_uz'];
    fileRu = json['file_ru'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_uz'] = this.nameUz;
    data['name_ru'] = this.nameRu;
    data['type'] = this.type;
    data['file_uz'] = this.fileUz;
    data['file_ru'] = this.fileRu;
    return data;
  }
}