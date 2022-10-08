import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class PDF extends StatefulWidget {
  const PDF({Key? key,required this.fileUz}) : super(key: key);
  final String fileUz;

  @override
  State<PDF> createState() => _PDFState();
}

class _PDFState extends State<PDF> {

  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    print('kdsfjsdofhduouogghedgugh_____________' +widget.fileUz);
    return  Scaffold(
      appBar: AppBar(
        title: const Text('  PDF '),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.download,
              color: Colors.white,
              semanticLabel: 'Bookmark',
            ),
            onPressed: () {
              var snackBar = SnackBar(content: Text('kitob saqlandi '));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              _pdfViewerKey.currentState?.openBookmarkView();
            },
          ),
        ],
      ),
      body: SfPdfViewer.network(
        'https://uts-davomat.uz/admin/uploads/mb-book/'+widget.fileUz,
        key: _pdfViewerKey,
      ),
    );
  }
}
