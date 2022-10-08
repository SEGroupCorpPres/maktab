import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:uts_maktab/models/class_model.dart';

class SinflarFetch {
//sinflar api
  Future<SinfModel?> sinflarfetchInfo() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/mobile/grade",
        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
        var data = SinfModel.fromJson(
          jsonDecode(response.body),

        );
        print("kelganlarmi data: ${response.body}");
        print(data);
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("$e");
    }
  }
//Fanlar api
  Future<SinfModel?> fetchfanlarInfo(int id) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/mobile/subject?grade_id=$id",
        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
        var data = SinfModel.fromJson(
          jsonDecode(response.body),

        );
        print("kelganlarmi data: ${response.body}");
        print(data);
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("$e");
    }
  }
//Kitoblar apii
  Future<SinfModel?> fetchkitoblarInfo(int id) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/mobile/book?subject_id=$id",
        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
        var data = SinfModel.fromJson(
          jsonDecode(response.body),

        );
        print("kelganlarmi data: ${response.body}");
        print(data);
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("$e");
    }
  }
  //Mavzular Api
  Future<SinfModel?> fetchmavzular(int id) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/mobile/topic?subject_id=1",
        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
        var data = SinfModel.fromJson(
          jsonDecode(response.body),

        );
        print("kelganlarmi data: ${response.body}");
        print(data);
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("$e");
    }
  }

  //Faylar Api
  Future<SinfModel?> fetchFaylarInfo(  int id, ) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/mobile/file?topic_id=$id",
        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
        var data = SinfModel.fromJson(
          jsonDecode(response.body),

        );
        print("+++++++++++++++MAlumot kelayapti data: ${response.body}");
        print(data);
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("$e");
    }
  }
}