
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uts_maktab/models/class_model.dart';
import 'package:uts_maktab/sevices/Local_Notification_Service/class_servise.dart';
import 'package:video_player/video_player.dart';


class VideoApp extends StatefulWidget {
  final String id;
  final String fileuz;

  VideoApp({
    Key? key,
    required this.id,
    required this.fileuz
  }) : super(key: key);

  @override
  State<VideoApp> createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();

    print('hsbshbxsbuee'+widget.fileuz);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    int pageIndex = 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          "Darslar",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: SinflarFetch().fetchFaylarInfo(int.parse(widget.id)),
          builder: (BuildContext context, AsyncSnapshot<SinfModel?> snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (_, __) {
                    return Card(
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 0, bottom: 15, top: 40),
                              child: Row(
                                children: [
                                  new Text("${snapshot.data!.data![__].nameUz}",
                                      style: new TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue)),
                                ],
                              ),
                            ),
                            Divider(),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  child: Column(children: [
                                    Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                "${snapshot.data!.data![__].nameUz}"),
                                          ],
                                        ),
                                        FlickVideoPlayer(
                                          flickManager: FlickManager(
                                            videoPlayerController: VideoPlayerController.network(
                                                'https://uts-davomat.uz/admin${snapshot.data!.data![__].fileUz}'
                                              // 'https://uts-davomat.uz/admin'+widget.fileuz,
                                            ),
                                          ),
                                          flickVideoWithControls:
                                          FlickVideoWithControls(
                                            closedCaptionTextStyle:
                                            TextStyle(fontSize: 10),
                                            controls: FlickPortraitControls(),
                                          ),
                                          flickVideoWithControlsFullscreen:
                                          FlickVideoWithControls(
                                            controls: FlickLandscapeControls(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          ]),
                    );
                  });
            }
            return Center(child:Center(
              child: CircularProgressIndicator(),
            ));
          }),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            // topLeft: Radius.circular(20),
            // topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: pageIndex == 0
                  ? const Icon(
                Icons.home,
                color: Colors.blue,
                size: 35,
              )
                  : const Icon(
                Icons.home,
                color: Colors.black,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
                  ? const Icon(
                Icons.search,
                color: Colors.blue,
                size: 35,
              )
                  : const Icon(
                Icons.search_outlined,
                color: Colors.black,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
                  ? const Icon(
                Icons.videocam,
                color: Colors.blue,
                size: 35,
              )
                  : const Icon(
                Icons.videocam,
                color: Colors.black,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? const Icon(
                Icons.person,
                color: Colors.blue,
                size: 35,
              )
                  : const Icon(
                Icons.person,
                color: Colors.black,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}