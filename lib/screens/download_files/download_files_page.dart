import 'dart:async';
import 'dart:math';

import 'package:file_loader/models/downloaded_file.dart';
import 'package:file_loader/providers/file_provider.dart';
import 'package:file_loader/screens/download_files/widgets/download_file_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DownloadFilesPage extends StatefulWidget {
  const DownloadFilesPage({Key? key}) : super(key: key);

  @override
  _DownloadFilesPageState createState() => _DownloadFilesPageState();
}

class _DownloadFilesPageState extends State<DownloadFilesPage> {
  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Загрузка файлов",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: fileProvider.files.length != 0
              ? Text(
                  "загружено файлов: ${fileProvider.files.length}",
                  style: TextStyle(color: Colors.white),
                )
              : Text(
                  "нету загруженных файлов",
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
      body: DownloadFileBody(),
      // кнопка добавления новой загрузки файла
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            if (fileProvider.files.length < 30) {
              DownloadedFile file =
                  DownloadedFile(1, " в ожидании", Random().nextInt(7) + 3);
              fileProvider.addFile(file);
              downloadingFile(file, fileProvider);
            } else {
              final snackBar =
                  SnackBar(content: Text('Нельзя загрузить больше 30 файлов'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }),
    );
  }
  // помещаем в очередь для выполнения
  Future<void> downloadingFile(DownloadedFile file, fileProvider) async {
    unawaited(fileProvider.queue
        .add(() async {
          fileProvider.changeFileStatus(file, "загружается");
          await Future.delayed(Duration(seconds: file.second));
        })
        .then((result) => fileProvider.changeFileStatus(file, "Загружен")));
  }

  void unawaited(Future<void> future) {}
}
