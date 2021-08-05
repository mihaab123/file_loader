import 'package:file_loader/providers/file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    final fileProvider = Provider.of<FileProvider>(context);
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // кнопки
          ElevatedButton(onPressed: fileProvider.files.length==0? null :()=>SaveButton(), child: Text("Сохранить")),
          ElevatedButton(onPressed: fileProvider.files.length==0? null :()=>fileProvider.deleteFiles(), child: Text("Сбросить"))
        ],
      ),
    );
  }
  void SaveButton(){
    final snackBar = SnackBar(content: Text('Успешно сохранено'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
