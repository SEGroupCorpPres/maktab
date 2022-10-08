import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:uts_maktab/sevices/search_page.dart';
import '../../provider/child_page_provider.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  DateTime date = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedDate1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String? begindata;
  String? enddata;

  @override
  void initState() {
    Provider.of<ChildProvider>(context, listen: false).getInfo().asStream();
    // Provider.of<ChildProvider>(context, listen: false).getSearch('').asStream();
    formattedDate;
    formattedDate1;

    SearchPagefetch();
    super.initState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<ChildProvider>(
      builder: (context, data, child) {
        if (!data.isInfo) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white10,
                  width: 450,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Qidiruv".tr(),
                          style: TextStyle(fontSize: 25),
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data.childSerch!.pupil!.fullName}",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? begindata = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2010),
                            lastDate: DateTime(2030));
                        setState(() {
                          if (begindata == null) {
                            return;
                          }
                          formattedDate1 = DateFormat.yMd()
                              .format(begindata)
                              .split('/').reversed
                              .join('-');
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_month_sharp,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(formattedDate1)),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime? enddata = await showDatePicker(
                            context: context,
                            initialDate: date,
                            firstDate: DateTime(2022),
                            lastDate: DateTime(2030));
                        setState(() {
                          if (enddata == null) {
                            return;
                          } else {
                            formattedDate = DateFormat.yMd()
                                .format(enddata)
                                .split('/').reversed
                                .join('-');
                          }
                        });
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_month_sharp,
                          ),
                          Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(formattedDate)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 55,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.indigo.withAlpha(12),
                            blurRadius: 4,
                            offset: Offset(0, 8),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                          onPressed: () {
                            data.getSearch(
                                data.pupilid.toString(),
                                formattedDate1.toString(),
                                formattedDate.toString());
                            print(formattedDate1      + "Nizomididdib");
                            print(formattedDate    + "Nizomididdib6310256489");
                          },
                          child: Text(
                            "Qidiruv".tr(),
                          )),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black,
                ),
                ListView.builder(

                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.childSerch!.comeOuts!.length,
                    itemBuilder: (context, index) {
                      data.photoForSearch = data.childSerch!.comeOuts![index].photo!.split('/')[6];
                      return Column(
                        children: [
                          Container(
                            width: 350.w,
                            height: 60.h,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 20.r,
                                  // borderRadius: BorderRadius.all(Radius.circular(30.r)),
                                  backgroundImage: CachedNetworkImageProvider(
                                    'https://uts-davomat.uz/admin/uploads/thumb/${data.childSerch!.pupil!.thumbImage}'
                                        .toString(),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${data.childSerch!.pupil!.fullName.toString()}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "${data.childSerch!.pupil!.school}",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          180, 0, 0, 0),
                                      child: Row(
                                        children: [
                                          Text(
                                            '${data.childSerch!.comeOuts![index].time}',
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 350.w,
                            height: 230.h,
                            child: CachedNetworkImage(
                              imageUrl:
                                  "https://uts-davomat.uz/admin/uploads/dss/${data.childSerch!.comeOuts![index].photo}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
        );
      },
    ));
  }
}
