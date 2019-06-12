import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MytestState();
  //git remote add origin git@github.com:chrism1981/flutter_practice.git 1
}

class _MytestState extends State<MyTest> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    animation = Tween<double>(begin: 0,end: 300).animate(controller)
    ..addListener((){
      setState(() {

      });

    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        margin: EdgeInsets.symmetric(vertical: 8),
        child: FlutterLogo(),
      ),
    );
  }

}

void main(){
  runApp(MyTest());
}