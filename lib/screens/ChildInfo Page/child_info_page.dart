import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import '../../provider/child_page_provider.dart';

class ChildInfoPage extends StatefulWidget {
  ChildInfoPage({Key? key}) : super(key: key);

  @override
  State<ChildInfoPage> createState() => _ChildInfoPageState();
}

class _ChildInfoPageState extends State<ChildInfoPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ChildProvider>(context, listen: false).getInfo().asStream();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    return Scaffold(body: Consumer<ChildProvider>(
      builder: (_, data, __) {
        if(!data.isInfo){
          return Center(child: CircularProgressIndicator(),);
        }
        return SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.h),
                child: Column(
                  children: [
                    Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ...List.generate(
                                  data.childInfo!.children!.length,
                                  (index) => Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          // await Hive.box('child').put(
                                          //     'child',
                                          //     stateA.loadedChild!
                                          //         .children![index].id);
                                          // await ChildPhotoService(stateA
                                          //         .loadedChild!
                                          //         .children![index]
                                          //         .id.toString())
                                          //     .fetchPhoto(id: stateA.loadedPhoto!.comeOuts![index].id.toString());
                                          // print(Hive.box('child').get('child'));
                                          // BlocProvider.of<PhotoBloc>(context)
                                          //     .add(GetPhotoEvent());
                                          // setState(() {});
                                          // data.childInfo!.children![index].id !=
                                          //         null
                                          //     ? data.ChildId = data.childInfo!
                                          //         .children![index].id
                                          //     : data.childInfo!.children![index]
                                          //         .id;
                                         setState(() {
                                           print('bosildi');
                                           Provider.of<ChildProvider>(context,
                                               listen: false)
                                               .getPhoto(data.childInfo!
                                               .children![index].id
                                               .toString());
                                         });
                                          // Hive.box('peopleId').put('peopleId', Provider.of<ChildProvider>(context,
                                          //     listen: false)
                                          //     .getSearch(data.childInfo!
                                          //     .children![index].id
                                          //     .toString()));
                                          data.childId = data.childInfo!
                                              .children![index].id
                                              .toString();
                                          Provider.of<ChildProvider>(context,
                                              listen: false)
                                              .getSearch(data.childInfo!
                                              .children![index].id
                                              .toString(),"${date}","${date}",);
                                         data.pupilid= data.childInfo!
                                             .children![index].id
                                             .toString();
                                        },
                                        borderRadius:
                                            BorderRadius.circular(25.r),
                                        child: CircleAvatar(
                                          radius: 25.r,
                                          // borderRadius: BorderRadius.all(Radius.circular(30.r)),
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                            'https://uts-davomat.uz/admin/uploads/thumb/${data.childInfo!.children![index].thumbImage.toString()}',
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.w,
                                      ),
                                    ],
                                  ),
                                )
                              ]),
                        ),

                        ///that here
                        SizedBox(
                          height: 5.h,
                        ),
                        Container(
                          height: 250.h,
                          width: 450.w,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                getThumb(data.childPhoto!.pupil!.thumbImage
                                    .toString()),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  data.childPhoto!.pupil!.fullName.toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  data.childPhoto!.pupil!.teacherName
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black54),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                tr("Maktab"),
                                                style: TextStyle(
                                                    color: Colors.blue[700]),
                                              ),
                                              Text(data
                                                  .childPhoto!.pupil!.school
                                                  .toString()),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(tr("Sinf"),
                                                  style: TextStyle(
                                                      color: Colors.blue[700])),
                                              Text(data.childPhoto!.pupil!.grade
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            children: [
                                              Text(tr("Balans"),
                                                  style: TextStyle(
                                                      color: Colors.blue[700])),
                                              Text(
                                                  "${data.childPhoto!.balance!.sum.toString()} So'm"),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Text(tr("O'quvchi ID si"),
                                                  style: TextStyle(
                                                      color: Colors.blue[700])),
                                              Text(data
                                                  .childPhoto!.pupil!.secretId
                                                  .toString()),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black),
                          ),
                        ),
                        ...List.generate(
                            data.childPhoto!.comeOuts!.length,
                            (index) {
                              data.phote = data.childPhoto!.comeOuts![index].photo!.split('/')[6];
                              print(data.phote.toString() + "aaaaaaaaa");
                              return
                              Column(
                                  children: [
                                    SizedBox(
                                      width: 350.w,
                                      height: 60.h,
                                      child: Row(
                                        children: [
                                          getThumb(data
                                              .childPhoto!.pupil!.thumbImage
                                              .toString()),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width -
                                                    180.w,
                                                child: Text(data
                                                    .childPhoto!.pupil!.fullName
                                                    .toString()),
                                              ),
                                              Text(
                                                data.childPhoto!.pupil!.school
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                261.w,
                                            child: Text(
                                              data.childPhoto!.comeOuts![index]
                                                  .time
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12.sp),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 350.w,
                                      height: 230.h,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            // stateA.loadedPhoto!
                                            //             .comeOuts![index].photo !=
                                            //         null
                                            //     ? '${stateA.loadedPhoto!.comeOuts![index].photo}'
                                            //     :

                                            'https://uts-davomat.uz/admin/uploads/dss/${data.phote}',
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    )
                                  ],
                                );})
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}

Widget getThumb(String? headerImage) {
  return CircleAvatar(
    radius: 25.r,
    // borderRadius: BorderRadius.all(Radius.circular(30.r)),
    backgroundImage: CachedNetworkImageProvider(
      // 'https://source.unsplash.com/random'
      'https://uts-davomat.uz/admin/uploads/thumb/$headerImage'.toString(),
    ),
  );
}
