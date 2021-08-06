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
  bool isLoaded = false;

  FileProvider.initialize(){
    loadFiles();
  }
  // для дальнейшей загрузки в базу
  Future<void> loadFiles()async{
    // get data
    notifyListeners();
  }
  // удалить все файлы
  Future<void> deleteFiles()async{
    files.clear();
    notifyListeners();
  }
  // добавить новый файл
  Future<void> addFile(DownloadedFile file)async{
    files.add(file);
    notifyListeners();
  }
  // удалить файл
  Future<void> deleteFile(DownloadedFile file)async{
    files.remove(file);
    notifyListeners();
  }
  // изменить статус документа
  Future<void> changeFileStatus(DownloadedFile file, String status)async{
    int index = files.indexOf(file);
    file.status = status;
    files[index] = file;
    notifyListeners();
    ChangeIsLoaded();

  }
  // проверяем есть ли файлы в загрузке
  Future<void> ChangeIsLoaded()async{
    isLoaded = false;
    for (var file in files) {
      if(!file.status.contains("загружен")){
        isLoaded = true;
      };
    }
    print(isLoaded);
    notifyListeners();
  }
}