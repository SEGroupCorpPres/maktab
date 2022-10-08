// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uts_maktab/bloc/child_info_bloc/child_info_event.dart';
// import 'package:uts_maktab/bloc/child_info_bloc/child_info_state.dart';
// import 'package:uts_maktab/bloc/child_photo_bloc/photo_event.dart';
// import 'package:uts_maktab/bloc/child_photo_bloc/photo_state.dart';
//
//
//
// import '../../models/child_info_model.dart';
// import '../../models/child_photo_model.dart';
// import '../../sevices/child_photo_repository.dart';
// import '../../sevices/child_repository.dart';
//
// class PhotoBloc extends Bloc<PhotoEvent,PhotoState>{
//   final ChildPhotoRepository? childPhotoRepository;
//   final ChildRepository? childRepository;
//
//   PhotoBloc(this.childPhotoRepository,this.childRepository):assert(childPhotoRepository != null && childRepository != null),super(PhotoEmptyState());
//
//   // @override
//   // get initialState => PhotoEmptyState();
//
//   @override
//   Stream<PhotoState> mapEventToState(PhotoEvent event) async*{
//     if(event is GetPhotoEvent){
//       print('event');
//
//       yield PhotoLoadingState();
//       try{
//           final ChildInfoModel? loadedInfoList = await childRepository?.getAll() ;
//           final ChildPhotoModel? loadedPhotoList = await childPhotoRepository?.getAl(id: '') ;
//
//         yield PhotoLoadedState(loadedPhoto: loadedPhotoList, loadedChild: loadedInfoList, id: '',);
//       }catch(e){
//         print(e.toString());
//         yield PhotoEmptyState();
//       }
//     }else{
//       yield PhotoEmptyState();
//     }
//   }
// }