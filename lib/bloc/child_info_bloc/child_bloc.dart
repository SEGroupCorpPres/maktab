// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:uts_maktab/bloc/child_info_bloc/child_info_event.dart';
// import 'package:uts_maktab/bloc/child_info_bloc/child_info_state.dart';
// import 'package:uts_maktab/sevices/child_repository.dart';
//
// import '../../models/child_info_model.dart';
//
// class ChildBloc extends Bloc<ChildEvent,ChildState>{
//   final ChildRepository? childRepository;
//   ChildBloc(this.childRepository):assert(childRepository != null),super(ChildEmptyState());
//
//   // @override
//   // get initialState => ChildEmptyState();
//
//   @override
//   Stream<ChildState> mapEventToState(ChildEvent event) async*{
//     if(event is ChildInfoGetEvent){
//       // yield ChildLoadingState();
//       try{
//         final ChildInfoModel? loadedChildList = await childRepository?.getAll();
//         print("try");
//         yield ChildLoadedState(loadedChild: loadedChildList);
//       }catch(_){
//         yield ChildEmptyState();
//       }
//     }else{
//       yield ChildEmptyState();
//     }
//   }
// }