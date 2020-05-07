import 'package:flutter/material.dart';

// Darwer抽屉组件. 常和ListView组合使用.
//添加头部效果,用以下两个组件实现: DrawerHeader , UserAccountsDrawerHeader


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Text('抽屉组件示例'),
      ),
      drawer: Drawer(child: ListView(
        children: <Widget>[
          //设置用户信息,如头像,用户名,email等
          UserAccountsDrawerHeader(
            accountName: new Text("清平乐"),
            accountEmail: new Text("test@163.com"),
            currentAccountPicture: new CircleAvatar(
              backgroundImage: new AssetImage("images/pic1.jpg"),
            ),
            onDetailsPressed: (){},
            otherAccountsPictures: <Widget>[
              new Container(
                child: Image.asset("images/code.png"),
              )
            ],
            ),
            //导航栏菜单
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.color_lens),), 
              title: Text('个性装扮'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.phone),),
              title: Text('我的相册'),
            ),
            ListTile(
              leading: new CircleAvatar(child: Icon(Icons.wifi),),
              title: Text('免流量特权'),
            ),
        ],
      ),),
    );
  }
}

//pubspec.yaml里配置本地图片
  // assets:
  //  - images/pic1.jpg
  //  - images/code.png