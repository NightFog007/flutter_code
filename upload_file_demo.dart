//需要下载的第三方库  http: ^0.12.0+2
//说明 https://blog.csdn.net/MidSummer411/article/details/116202518

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:http_parser/http_parser.dart';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//创建一个List变量 _selectedFile，它将文件作为具有长度的可索引对象集合保存
//同时也创建一个固定长度的List变量 _bytesData
  List<int> _selectedFile;
  Uint8List _bytesData;

//将文件转换为字节数据
//使用此方法，要将Base64数据转换为字节数据，最后必须使用.tostring().split(",")。否则将无法发送文件。
  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
      // print(utf8.decode(_selectedFile));
    });
  }

//要用到  http: ^0.12.0+2 库
  Future<String> makeRequest() async {
    var url = Uri.parse("http://127.0.0.1:8081/file_upload"); //后端搭起的POST接口.

    var request = new http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromBytes('file', _selectedFile,
        contentType: new MediaType('application', 'octet-stream'),
        filename: "file_up.xlsx"));

    request.send().then((response) {
      // print("test");
      // print(response.statusCode);
      if (response.statusCode == 200) print("Uploaded!");
    });

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return Center(
            child: new AlertDialog(
          title: new Text("Details"),
          //content: new Text("Hello World"),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("Upload successfull"),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('上传成功'),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        ));
      },
    );
  }

  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();

      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            MaterialButton(
              color: Colors.pink,
              elevation: 8,
              highlightElevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              textColor: Colors.white,
              child: Text('Select a file'),
              onPressed: () {
                startWebFilePicker();
              },
            ),
            RaisedButton(
              color: Colors.purple,
              elevation: 8.0,
              textColor: Colors.white,
              onPressed: () {
                makeRequest();
              },
              child: Text('Send file to server'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
