import 'package:flutter/material.dart';

//简单对话框组件 SimpleDialog ,通常需要配合SimpleDialogOption组件一起使用.
//通常对话框都是通过某个动作来触发渲染的,比如点击按钮,菜单等. 所以对话框一般都要封装在一个方法里实现.
//另外这个触发过程是异步的,需要加入async/await处理

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      home: Scaffold( 
        appBar: AppBar( 
          title: Text('组件示例'),
        ),
        body: Center(

        child: SimpleDialog(
          title: const Text('对话框标题'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: (){},
              child: const Text('第一行信息'),
            ),
            SimpleDialogOption(
              onPressed: (){},
              child: const Text('第二行信息'),
            ),
          ],
        ),
       
       
      ),
      ),
    );
  }
}
