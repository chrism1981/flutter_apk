import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_go/practice/Anim2.dart';

class PureWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return FlutterLogo();
  }
}

class AnimManager extends StatelessWidget{
  final Animation animation;
  final Widget childView;

  AnimManager(this.animation,this.childView);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        child: childView,
        builder: (context,child)=>Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          width: animation.value,
          height: animation.value,
          child: child,
        ),
      ),
    );
  }
}


class MyTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MytestState();
}

class _MytestState extends State<MyTest> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 1),vsync: this);
    animation = Tween<double>(begin: 0,end: 300).animate(controller)
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed)
        controller.reverse();
    });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimManager(animation,PureWidget());
  }
}

void main(){
//  runApp(MyTest());
  runApp(TwoAnim());
}