import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedItem extends StatelessWidget {
  /// Animate Items in First view. such as Gridview or  a Container and ...
  const AnimatedItem({
    super.key,
    required this.child,
    this.verticalOffset = 200.0,
    this.horizontalOffset = 0.0,
    this.index = 0,
    this.duration = const Duration(seconds: 1),
  });
  final Duration duration;
  final Widget child;
  final double verticalOffset;
  final double horizontalOffset;

  /// this is for gradeView or list item indexes.
  final int index;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      duration: duration,
      child: SlideAnimation(
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }
}
