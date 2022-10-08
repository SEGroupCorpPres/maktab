import 'dart:convert';
import 'package:http/http.dart'as http;
import '../models/child_info_model.dart';


class ChildInfoService {

  Future<ChildInfoModel?> fetchInfo() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/auth/token-login?usertoken=5c396b2a4617726a16e263bf54be4e24"
          // "http://192.168.100.13:8082/api/auth/token-login?usertoken=99e9d4af9e2079cd1a3901480c995348"

        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
    ChildInfoModel data = ChildInfoModel.fromJson(
          jsonDecode(response.body),

        );
        // print("kelganlarmi data: ${response.body}");
        // print(data);
        return data;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("$e");
      // return [];
    }
  }

}
