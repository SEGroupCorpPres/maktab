import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:http/http.dart'as http;
import '../models/child_photo_model.dart';


class ChildPhotoService {
  String? id;
  ChildPhotoService([this.id]);

  // ChildPhotoModel ls = ChildPhotoModel();
  Future<ChildPhotoModel?> fetchPhoto(
      {required String? id}
      ) async {
    try {//${Hive.box('child').get('child')}
      var response = await http.get(
        Uri.parse(
          'https://uts-davomat.uz/admin/api/pupil/last-davomat?pupil_id=$id&parent_token=5c396b2a4617726a16e263bf54be4e24',

        ),
      );
      print('$id');
      if (response.statusCode == 200) {
        var result = ChildPhotoModel.fromJson(
          jsonDecode(response.body),
        );

        return result;

      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      print("errrorororo -------------- $e");
      // return ls;
    }
  }

}
