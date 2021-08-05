import 'package:file_loader/providers/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'file_card.dart';

class DownloadFileBody extends StatefulWidget {
  const DownloadFileBody({Key? key}) : super(key: key);

  @override
  _DownloadFileBodyState createState() => _DownloadFileBodyState();
}

class _DownloadFileBodyState extends State<DownloadFileBody> {
  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileProvider>(context);
    return ListView.builder(
      itemBuilder: (_, index) {
        return FileCard(file: fileProvider.files[index],);
      },
      itemCount: fileProvider.files.length,
    );;
  }
}
