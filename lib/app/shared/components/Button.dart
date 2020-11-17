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
  final IconData icon;

  const BUTTON({this.text, this.onPressed, this.primary = true, this.icon});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: const EdgeInsets.only(right: AppStyles.spacing_normal),
      pressedOpacity: 0.5,
      child: Container(
        width: 140,
        padding: AppStyles.spacingNormal,
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          // Only applies the gradient if it's a primary button
          gradient: primary ? AppStyles.primaryGradient : null,
          borderRadius: AppStyles.borderRadius10,
          // Only applies the border if it's a secondary button
          border: !primary
              ? Border.all(color: AppStyles.primaryColor, width: 1.0)
              : null,
          // Only applies the shadow if it's a primary button
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
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primary
                    // If its primary set the text to white
                    ? Color.fromRGBO(255, 255, 255, 1)
                    // Otherwise set it to primary color
                    : AppStyles.primaryColor,
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
