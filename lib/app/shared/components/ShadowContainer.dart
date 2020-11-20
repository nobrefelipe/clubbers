import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';

/*
  This widget draws a white container 
  with a predefined BoxSHadow and Border Radius

  It receives margin and padding as parameters
  to allow custom spacing.

  @param Widget child
  @param EdgeInsetsGeometry margin
  @param EdgeInsetsGeometry padding

*/

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  const ShadowContainer({
    this.child,
    this.margin,
    this.padding = AppStyles.spacingNormal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: AppStyles.borderRadius10,
        boxShadow: [AppStyles.shadowBoxDecoration],
      ),
      child: child,
    );
  }
}
