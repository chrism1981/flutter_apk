import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TeenWidget extends AnimatedWidget{
  final Tween size = Tween<double>(begin: 0, end: 200);
  final Tween opaque = Tween<double>(begin: 0.1, end: 1);

  TeenWidget(Animation animation) :super(listenable:animation);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: opaque.evaluate(animation),
        child: Container(
          width: size.evaluate(animation),
          height: size.evaluate(animation),
          margin: EdgeInsets.symmetric(vertical: 100),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

class TwoAnim extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _TwoAnimState();
  }
 


}

class _TwoAnimState extends State<TwoAnim> with SingleTickerProviderStateMixin{
  Animation animation;
  AnimationController controller;

  @override
  initState(){
    super.initState();
    controller = AnimationController(duration: Duration(seconds: 2), vsync:this);
    animation = CurvedAnimation(parent: controller,curve: Curves.elasticIn)
    ..addStatusListener((status){
      if(status == AnimationStatus.completed)
        controller.reverse();
      else if(status == AnimationStatus.dismissed)
        controller.forward();
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TeenWidget(animation);
  }

}

