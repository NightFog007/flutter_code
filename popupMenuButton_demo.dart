import 'package:flutter/material.dart';

//弹出菜单组件PopupMenuButton Demo

void main() => runApp(MyApp());

enum ConferenceItem { AddMember , LockConference, ModifyLayout, TurnoffAll}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Scaffold( 
        appBar: AppBar( 
          title: Text('PopUpMenuButton组件示例'),
        ),
        body: Center(
          child: FlatButton( 
            onPressed: (){},
            child: PopupMenuButton<ConferenceItem>( 
              onSelected: (ConferenceItem result){},
              //菜单项构造器
              itemBuilder: (BuildContext context) => <PopupMenuEntry<ConferenceItem>>[
                //各菜单项
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.AddMember,
                  child: Text('添加成员'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.LockConference,
                  child: Text('锁定会议'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.ModifyLayout,
                  child: Text('修改布局'),
                ),
                const PopupMenuItem<ConferenceItem>(
                  value: ConferenceItem.TurnoffAll,
                  child: Text('挂断所有'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
