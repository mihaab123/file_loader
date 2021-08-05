import 'package:file_loader/providers/file_provider.dart';
import 'package:file_loader/screens/download_files/download_files_page.dart';
import 'package:file_loader/screens/home/widgets/home_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Симуляция загрузки файлов"),
        actions: [
          // пункт меню для загрузки файлов
          PopupMenuButton(
            itemBuilder: (BuildContext bc) => [
              PopupMenuItem(
                  child: ListTile(
                title: Text(
                  "Загрузка файлов",
                  style: TextStyle(color: Colors.black),
                ),
                subtitle: fileProvider.files.length != 0
                    ? Text(
                  "загружено файлов: ${fileProvider.files.length}",
                  style: TextStyle(color: Colors.black),
                )
                    : Text(
                  "нету загруженных файлов",
                  style: TextStyle(color: Colors.black),
                ),
              ), value: "/files"),
            ],
            onSelected: (String route) {
              Navigator.pushNamed(context, route);
            },
          ),
        ],
      ),
      body: HomeBody(),
    );
  }
}
