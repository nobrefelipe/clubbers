import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

/*
  BUTTON COMPONENT
  This widget draws a button
  The button may have two different styles : 
  filled and outlined  (primary or secondary)

  The default style is filled(primary)
  To set outined(secondary) style, set the parameter $primary to false

  It receives a $onPressed parameter with a function to be executed 
  when the button is pressed

  It can also recei a $icon that will be display on the 
  right side of the button 

  @param text
  @param onPressed
  @param primary
  @param icon

*/

class BUTTON extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool primary;
  final icon;
  final double width;
  final Color backgroundColor;
  final Color textColor;

  const BUTTON({
    this.text,
    this.onPressed,
    this.primary = true,
    this.icon,
    this.width,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    //
    // Set button text color.
    // If button is primary
    var color = primary
        // Set the color to WHITE
        ? Colors.white
        // Otherwise,
        // if textColor is not set
        : textColor == null
            // set the color to PRIMARY COLOR
            ? AppStyles.primaryColor
            // Otherwise set the color to
            // the passed textColor
            : textColor;
    /*
      TODO: create a separate widget for each kind of button
      The logic above enables us to change the button text color based on the button type.
      If the button is a primary, we want the text color to be white. (gradient button)
      If the button is nor primary and we dont pass a $textColor, we want text color to be primary (outlined button)
      If we pass a $textColr we want the button to be customizeble.
    */

    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.only(right: AppStyles.spacing_normal),
      pressedOpacity: 0.5,
      child: Container(
        //
        // If we set a width, let use the passed width
        // otherwise set the button full
        //
        width: width != null ? width : double.infinity,
        //
        // If we dont set a width, meand we want the button to be full width
        // thus lets set a bigger PADDING
        //
        padding: width == null ? AppStyles.spacingBig : AppStyles.spacingNormal,
        //
        // If we dont set a width, meand we want the button to be full width
        // thus lets set a bigger MARGIN
        //
        margin: width == null
            ? const EdgeInsets.only(bottom: AppStyles.spacing_big)
            : const EdgeInsets.only(bottom: AppStyles.spacing_normal),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          color: backgroundColor,
          //
          // Only applies the gradient if it's a primary button
          //
          gradient: primary ? AppStyles.primaryGradient : null,
          borderRadius: width == null
              ? AppStyles.borderRadius15
              : AppStyles.borderRadius10,
          //
          // Only applies the border if it's a secondary button
          //
          border: (!primary && backgroundColor == null)
              ? Border.all(color: AppStyles.primaryColor, width: 1.0)
              : null,
          //
          // Only applies the shadow if it's a primary button
          //
          boxShadow: primary ? [AppStyles.shadowBoxDecorationForButtons] : null,
        ),
        child: Row(
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: GoogleFonts.comfortaa(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
