import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  CustomPageRoute({required this.child, required this.direction})
      : super(
          transitionDuration: Duration(seconds: 1),
          reverseTransitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) =>
      SlideTransition(
        position: Tween<Offset>(
                begin: getBeginOffset(direction), end: const Offset(0, 0))
            .animate(animation),
        child: child,
      );
}

Offset getBeginOffset(AxisDirection direction) {
  switch (direction) {
    case AxisDirection.up:
      return const Offset(0, -1);
    case AxisDirection.down:
      return const Offset(0, 1);
    case AxisDirection.left:
      return const Offset(-1, 0);
    default:
      return const Offset(1, 0);
  }
}
