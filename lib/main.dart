import 'package:file_loader/providers/file_provider.dart';
import 'package:file_loader/screens/download_files/download_files_page.dart';
import 'package:file_loader/screens/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // подключаем провайдер
    return MultiProvider(
        providers: [
        ChangeNotifierProvider.value(value: FileProvider.initialize()),
    ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      // настройка переходов
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const HomePage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/files': (context) => const DownloadFilesPage(),
      },
    ));
  }
}
