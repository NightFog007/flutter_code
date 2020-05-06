import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';  //Material Design是一套Google风格的视觉设计
import 'package:provider/provider.dart';




void main() => runApp(new MyApp());



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context){

    //使用MultiProvider可以创建多个顶层共享数据

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>Counter() ,),
      ],
      child: MaterialApp(  //MaterialApp-Material应用组件,代表纸墨设计风格的应用
          title: 'Provider示例',
          
          home: FirstPage(), //home是一个Widget对象,用来定义当前应用打开时,所显示的界面
      
    ),
    );
  }
}

class FirstPage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:  AppBar(
        title: Text('这是第一页'),
        actions: <Widget>[
          FlatButton( 
            child: Text("下一页"),
            //路由跳转至第二页
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) {
              return SecondPage();
            })),
          ),
        ],
      ),
      body: Center(
        //获取计数器中的count值
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //调用数据模型中的increment方法更改数据
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class SecondPage extends StatelessWidget { 
  @override 
  Widget build(BuildContext context){
    return  Scaffold(
      appBar:  AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: Text("${Provider.of<Counter>(context).count}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Provider.of<Counter>(context, listen: false).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

/*
 计数器类Counter即为数据Model,实际上就是状态.
 Counter不仅存储了数据,还包含了更改数据的方法,并暴露相关数据.
 使用mixin混入ChangeNotifier类,这个类能够自动管理所有听众.
 当调用notifyListeners时,它会通知所有听众进行刷新.
 */

class Counter with ChangeNotifier {  //通过mixin的方式混入了ChangeNotifier,这个类能够自动管理所有听众
  //存储数据,下划线开头代表私有
  int _count = 0;
  //通过get把_count值暴露出来,提供外部能够访问的数据
  int get count => _count;

  //提供更改数据的方法
  void increment(){
    _count++;
    //通知所有听众进行刷新
    notifyListeners();
  }
}