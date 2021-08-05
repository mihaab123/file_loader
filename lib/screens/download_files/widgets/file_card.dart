import 'package:file_loader/models/downloaded_file.dart';
import 'package:file_loader/providers/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// настройка элемента списка
class FileCard extends StatelessWidget {
  final DownloadedFile file;
  const FileCard({Key? key,required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileProvider>(context);
    return ListTile(
      title: Text((fileProvider.files.indexOf(file,0)+1).toString()),
      subtitle: Text(file.status),
      trailing: IconButton(onPressed: () { fileProvider.deleteFile(file); }, icon: Icon(Icons.delete),),
    );
  }
}
