import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uts_maktab/auth%20_cubit/auth_cubit.dart';
import 'package:uts_maktab/models/class_model.dart';
import 'package:uts_maktab/sevices/Local_Notification_Service/class_servise.dart';
import 'package:uts_maktab/sevices/Text_Book/textbook_dart.dart';

class ThreethPage extends StatefulWidget {
  const ThreethPage({Key? key}) : super(key: key);

  @override
  State<ThreethPage> createState() => _ThreethPageState();
}

class _ThreethPageState extends State<ThreethPage> {

  void setlocale(Locale locale) => context.setLocale(context.locale);
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding:
      const EdgeInsets.only(top: 0.0, bottom: 0.0, left: 0.0, right: 0.0),
      child: SingleChildScrollView(
        child: Card(
          child: BlocBuilder<AuthCubit,AuthState>(
            builder: (context,state){
              return  Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 280, bottom: 15, top: 40),
                    child:  Text("Sinf".tr(),
                        style:TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Divider(
                    color: Colors.black12,
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          ListTile(
                              title: Text(
                                "Sinf".tr(),
                                textScaleFactor: 1.5,
                              ),
                              selected: false,
                              onTap: () {}),
                          const Divider(
                            color: Colors.black,
                          ),
                          FutureBuilder<SinfModel?>(
                            future: SinflarFetch().sinflarfetchInfo(),
                            builder: (BuildContext context,
                                AsyncSnapshot<SinfModel?> snapshot) {
                              if (snapshot.hasData) {
                                return ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data!.data!.length,
                                  separatorBuilder: (_,__)=>const Divider(color: Colors.black,),
                                  itemBuilder: (_, __) {
                                    return ListTile(
                                        title:
                                        Text(context.read<AuthCubit>().selectedLang.index==1
                                          ?
                                        "${snapshot.data!.data![__].nameUz}":
                                        "${snapshot.data!.data![__].nameRu}"
                                          ,textScaleFactor: 1,
                                        ),
                                        selected: false,
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TextBook(
                                                        id:"${snapshot.data!.data![__].id}",
                                                        nameuz:"${snapshot.data!.data![__].nameUz}",
                                                        nameru:"${snapshot.data!.data![__].nameUz}",
                                                      )));
                                        });
                                  },
                                );
                              }
                              return Center(child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
