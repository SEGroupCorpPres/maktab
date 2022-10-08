import 'package:flutter/cupertino.dart';
import 'package:uts_maktab/models/child_photo_model.dart';

import '../../models/child_info_model.dart';

abstract class PhotoState{}

class PhotoEmptyState extends PhotoState{}

class PhotoLoadingState extends PhotoState{

}

class PhotoLoadedState extends PhotoState{
  ChildPhotoModel? loadedPhoto;
  ChildInfoModel? loadedChild;
  String id;
  PhotoLoadedState({@required this.loadedPhoto,@required this.loadedChild,required this.id})
      : assert(loadedPhoto != null && loadedChild != null);
}

class PhotoErrorState extends PhotoState{

}
