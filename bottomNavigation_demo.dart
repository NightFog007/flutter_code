import 'package:flutter/material.dart';

//底部导航Demo

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(  //MaterialApp-Material应用组件,代表纸墨设计风格的应用
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'), //home是一个Widget对象,用来定义当前应用打开时,所显示的界面
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

  int _selectedIndex = 0;  //默认索引值

  final _widgetOptions = [
    Text('Index 0: 信息'),
    Text('Index 1: 通讯录'),
    Text('Index 2: 发现'),
  ];

  

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index ;
    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(  //Scaffold-脚手架组件,实现了基本的Material Design布局
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        
      ),
      body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),

            //底部导航按钮,包含图标及文本
     bottomNavigationBar:  BottomNavigationBar(
              items:<BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.chat),title:Text(' 信息 ')),
                BottomNavigationBarItem(icon: Icon(Icons.contacts), title: Text(' 通讯录 ')),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text(' 发现 ')),
              ],
              currentIndex: _selectedIndex, //当前选中项的索引
              fixedColor: Colors.deepPurple,  //选择选项时的颜色
              onTap: _onItemTapped, //选择按下处理
            ),
         
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



