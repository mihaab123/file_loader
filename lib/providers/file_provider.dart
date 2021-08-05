import 'dart:math';

import 'package:file_loader/models/downloaded_file.dart';
import 'package:flutter/material.dart';
import 'package:queue/queue.dart';

// описание работы провайдера
class FileProvider with ChangeNotifier{
  // список файлов
  List<DownloadedFile> files = [];
  // очередь выполнения загрузки с ограничением в 3 параллельных процесса
  final queue = Queue(parallel: 3);

  FileProvider.initialize(){
    loadFiles();
  }

  Future<void> loadFiles()async{
    // get data
    notifyListeners();
  }
  Future<void> deleteFiles()async{
    files.clear();
    notifyListeners();
  }
  Future<void> addFile(DownloadedFile file)async{
    files.add(file);
    notifyListeners();
  }
  Future<void> deleteFile(DownloadedFile file)async{
    files.remove(file);
    notifyListeners();
  }
  Future<void> changeFileStatus(DownloadedFile file, String status)async{
    int index = files.indexOf(file);
    file.status = status;
    files[index] = file;
    notifyListeners();
  }
}