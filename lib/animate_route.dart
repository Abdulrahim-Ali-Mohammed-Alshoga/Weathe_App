import 'package:flutter/material.dart';
class AnimateRoute extends PageRouteBuilder{
  final page;
  final topOrBottom;
  final rightOrleft;
  AnimateRoute({this.page, this.topOrBottom,this.rightOrleft}):super(
    pageBuilder: (context, animation, secondaryAnimation) =>  page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(rightOrleft, topOrBottom);
      const end = Offset.zero;
      const curve = Curves.linear;
      final tween = Tween(begin: begin, end: end);
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );
     // final offsetAnimation = animation.drive(tween);
      return SlideTransition(
        position:  tween.animate(curvedAnimation),
        child: child,
      );
    },
  );

}
