import 'package:flutter/material.dart';

//AlertDialog - 提示对话框组件

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

        child: AlertDialog(
          title: Text('提示'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('是否要删除?'),
                Text('一旦删除数据不可恢复!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(child: Text('确定'), onPressed: (){},),
            FlatButton(child: Text('取消'), onPressed: (){},),
          ],

        ),
       
       
      ),
      ),
    );
  }
}
