import 'package:flutter/cupertino.dart';

import '../../models/child_info_model.dart';

abstract class ChildState {}

class ChildEmptyState extends ChildState {}

class ChildLoadingState extends ChildState {}

class ChildLoadedState extends ChildState {
  ChildInfoModel? loadedChild;
  ChildLoadedState({@required this.loadedChild}) : assert(loadedChild != null);
}

class ChildErrorState extends ChildState {}
