import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget { 
  @override 
  Widget build(BuildContext context){

    Widget container = Container(
      decoration: BoxDecoration( //添加装饰效果
        color:  Colors.grey,  //背景色
      ),
      //子元素指定为一个垂直水平嵌套布局的组件
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded( //使用Expanded防止内容溢出
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration( //添加边框样式
                    border: Border.all(width: 10.0,color: Colors.blueGrey),//上下左右边框都为10
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),//上下左右边框弧度设置为8.0
                  ),
                  margin: const EdgeInsets.all(4.0), //上下左右增加边距
                  child: Image.asset('images/1.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0,color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/2.jpg'),
                ),
              ),
              
            ],
          ),
          Row(
            children: <Widget>[
              Expanded( //使用Expanded防止内容溢出
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration( //添加边框样式
                    border: Border.all(width: 10.0,color: Colors.blueGrey),//上下左右边框都为10
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),//上下左右边框弧度设置为8.0
                  ),
                  margin: const EdgeInsets.all(4.0), //上下左右增加边距
                  child: Image.asset('images/3.jpg'),
                ),
              ),
              Expanded(
                child: Container(
                  width: 150.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 10.0,color: Colors.blueGrey),
                    borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
                  ),
                  margin: const EdgeInsets.all(4.0),
                  child: Image.asset('images/4.jpg'),
                ),
              ),
              ]
            ),
        ],
      ),
    );
    return  Scaffold(
      appBar: new AppBar(
        title: Text('Container Demo'),
      ),
      body: container,
    );
  }
}
