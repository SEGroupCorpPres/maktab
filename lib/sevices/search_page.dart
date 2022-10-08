
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart'as http;
import 'package:uts_maktab/models/searchmodel_child.dart';



class SearchPagefetch {



  Future<ChildSearchModel?> fetchSearchPage(   {required String id,required String begindata,required String enddata}
   ) async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://uts-davomat.uz/admin/api/pupil?begin_date=$begindata&end_date=$enddata&pupil_id=$id",
        ),
      );
      print("--------------${response.statusCode}");
      if (response.statusCode == 200) {
        var data = ChildSearchModel.fromJson(
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

}