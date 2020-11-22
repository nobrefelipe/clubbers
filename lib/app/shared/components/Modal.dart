import 'package:clubbers/app/shared/components/Button.dart';
import 'package:clubbers/app/shared/components/ShadowContainer.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:clubbers/app/shared/styles/typography.dart';
import 'package:flutter/material.dart';

/*
  MODAL COMPONENT
  THis component is used when we want to present
  a modal to the user.

  How to use:
  
  Navigator.of(context).push(
      MODAL(
        title: "Title",
        content: Column(
          children: [
            TEXT(
              textAlign: TextAlign.center,
              text: "content",
            ),
            SizedBox(height: 20),
            onOk: someFunction(),
            okText: "Button"
            Spinner(icon: FontAwesome.spinner),
          ],
        ),
      ),
    );

    @param title
    @param content
    @param okText
    @param onOk

*/
class MODAL extends ModalRoute<void> {
  final String title;
  final Widget content;
  final String okText;
  final Function onOk;

  MODAL({
    this.title,
    this.content,
    this.onOk,
    this.okText = "ok",
  });
  // Animation duration
  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  // Make the overlay transparent
  @override
  bool get opaque => false;

  // Click on the overlay closes de modal
  // If we dont pass a OK FUNCTION we disable the ability to close the modal from the overlay
  @override
  bool get barrierDismissible => onOk != null ? true : false;

  // Overlay color
  @override
  Color get barrierColor => Colors.black.withOpacity(0.8);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    //
    // This makes sure that text and other content follows the material style
    //
    return Material(
      //
      //  This makes the modal trasnaparent
      //
      type: MaterialType.transparency,
      //
      // make sure that the overlay content is not cut off
      //
      child: SafeArea(
        child: _buildOverlayContent(
          title,
          content,
          onOk,
          okText,
          context,
        ),
      ),
    );
  }

  Widget _buildOverlayContent(
    title,
    content,
    onOk,
    okText,
    context,
  ) {
    return Center(
      child: ShadowContainer(
        padding:
            const EdgeInsets.only(top: 32, bottom: 24, left: 16, right: 16),
        margin: AppStyles.spacingBig,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            //
            // Modal title
            //
            HeadingComfortaa(
              text: title,
              heading: 5,
              weight: FontWeight.bold,
            ),
            SizedBox(height: 24),
            //
            // Modal content
            //
            content != null ? content : Container(),
            SizedBox(height: 24),
            //
            // Main Button
            //
            onOk != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BUTTON(
                        text: okText,
                        width: 160,
                        onPressed: onOk,
                        // onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    //
    // Content animation
    //
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
