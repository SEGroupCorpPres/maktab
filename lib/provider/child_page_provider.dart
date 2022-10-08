


import 'dart:io';

import 'package:flutter/src/foundation/change_notifier.dart';


import '../models/child_info_model.dart';
import '../models/child_photo_model.dart';
import '../models/searchmodel_child.dart';
import '../sevices/child_info_service.dart';
import '../sevices/child_photo_service.dart';
import '../sevices/search_page.dart';

class ChildProvider extends ChangeNotifier{

ChildInfoModel? childInfo =   ChildInfoModel();
ChildPhotoModel? childPhoto = ChildPhotoModel();
ChildSearchModel? childSerch = ChildSearchModel();

bool isChild = false;
bool isSearch = false;
bool isInfo = false;
bool checkSearch = false;
String? phote;
String? photoForSearch;
String ?pupilid;
String? childId;

void setChild(bool val){
  isChild = val;
  notifyListeners();
}
void setInfo(bool val)async{
  isInfo = val;
  notifyListeners();
}
void searchchild(bool val){
  isSearch = val;
  notifyListeners();
}

void isCheck(bool val){
  checkSearch = val;
  notifyListeners();
}

Future<void> getInfo() async {
  setInfo(false);
  childInfo = await ChildInfoService().fetchInfo();
  await getPhoto(childInfo!.children!.first.id!);

  setInfo(true);
}

Future<void> getPhoto(String id) async {
  setChild(false);
  childPhoto = await ChildPhotoService().fetchPhoto(
      id: id
  );
  // await getSearch(childInfo!.children!.first.id!);
  setChild(true);
}

Future<void> getSearch(String id,String begindata,String enddata  ) async {
  setChild(false);
  childSerch = await SearchPagefetch().fetchSearchPage(id:id,begindata:begindata,enddata:enddata);
  setChild(false);
}
}