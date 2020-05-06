import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  //Material Design是一套Google风格的视觉设计
import 'package:url_launcher/url_launcher.dart';
import 'package:t0506/provider_demo.dart';


//AppBar,MaterialApp和Scaffold都属于Material Design风格组件,它们同级. 

void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){


    final appName = '自定义主题';

    return MaterialApp(  //MaterialApp-Material应用组件,代表纸墨设计风格的应用
      title: appName,
      theme: ThemeData(
        brightness: Brightness.light, //应用程序整体主题的亮度
        primaryColor: Colors.lightGreen[600], //App主要部分的背景色
        accentColor: Colors.orange[600],
      ),
      home: MyHomePage(title: appName), //home是一个Widget对象,用来定义当前应用打开时,所显示的界面
      routes:{  //routes-定义应用中页面跳转规则
        '/first': (BuildContext context) => FirstPage(),
        '/second': (BuildContext context) => SecondPage(),
        '/third':(BuildContext context) => ProviderDemo(),
      },
      initialRoute: '/third', //初始路由页面为first页面
    );
  }
}

class MyHomePage extends StatefulWidget {

  final String title;

  //flutter里Key是每一个Widget的唯一身份标识,它是在组件创建及渲染时生成的.
  //接收title值 key 为widget的唯一标识
  MyHomePage({Key key, @required this.title}) : super(key: key);
  //Key派生出Localkey和Globalkey.
  //Localkey:直接继承自Key.应用于拥有相同父Element的组件进行比较的情况.
  //GlobalKey: 可以通过GlobalKey找到持有该GlobalKey的Widget,state和element.


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
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
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Container(
              color: Theme.of(context).accentColor,
              child:Text(
                '带有背景颜色的文本组件',
                style: Theme.of(context).textTheme.title,
              ),
            ),

            //图标组件
            new Icon(Icons.phone,color:Colors.green[500],size:80.0),

            //图标按钮组件
            new IconButton(icon: Icon(Icons.volume_up,size:48.0,),
              tooltip: '按下操作',
              onPressed:(){
                print('按下操作');
              }
            ),

            //本地图片
            new Image.asset(
              'images/lake.jpg',
              height:120.0,
              fit:BoxFit.cover,
            ),
          
            //URL跳转
            new RaisedButton(
              child: new Text('open baidu'),
              onPressed: (){
                const url = 'https://www.baidu.com';
                launch(url);
            },
            
            ),

            

            Center(
              child: Container(
                width: 200,
                height:100,
                //添加边框装饰效果
                decoration: BoxDecoration(
                  color:Colors.white,
                  border: new Border.all(
                    color: Colors.grey, 
                    width: 8.0,),
                  borderRadius:  
                    const BorderRadius.all(const Radius.circular(8.0)), //边框的弧度                    
                ),
                child: Text( 
                  'Flutter',
                  textAlign: TextAlign.center,
                  style:TextStyle(fontSize:28.0),
                ),
              ),
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

class FirstPage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: Text('这是第一页'),
      ),
      body: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          RaisedButton( 
          onPressed: (){
            Navigator.pushNamed(context, '/second');
          },
          child: Text( 
            '这是第一页',
            style: TextStyle(fontSize: 28.0),
          ),
        ),
          // RaisedButton(
          //   child: Text("Third-自定义主题"),
          //   onPressed: () {
          //     print("RaisedButton Third-自定义主题 Click");
          //   },
          // ),
          ]
      ),
      
      bottomNavigationBar: BottomAppBar(  //显示在底部的导航栏按钮栏
        child: Container(height: 50.0,),
      ),
      floatingActionButton: FloatingActionButton(  //定义功能按钮
        onPressed: (){},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      //定义功能按钮的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SecondPage extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar( 
        title: Text('这是第二页'),

      ),
      body: Center(child: RaisedButton( 
        onPressed: (){
          Navigator.pushNamed(context, '/first');
        },
        child: Text( 
          '这是第二页',
           style: TextStyle(fontSize: 28.0),
        ),
      ),),
    );
  }
}

class ThirdPage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context){
    final appName = '自定义主题';

    return MaterialApp(
      title: appName,
      theme: ThemeData( 
        brightness: Brightness.light,
        primaryColor: Colors.orange[600],
      ),
      home: MyHomePage(
        title: appName,
      ),
      
    );
  }
}
