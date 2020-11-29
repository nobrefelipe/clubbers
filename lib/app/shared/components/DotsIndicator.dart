import 'dart:math';

import 'package:flutter/material.dart';

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.color: Colors.white,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// The color of the dots.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 5.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 1.5;

  // The distance between the center of each dot
  static const double _kDotSpacing = 12.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.3,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );

    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      child: Center(
        child: Material(
          color: controller.page == index
              ? color.withOpacity(selectedness)
              : color.withOpacity(
                  selectedness,
                ),
          type: MaterialType.circle,
          child: Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
