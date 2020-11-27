import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CLOutlinedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final icon;
  final double width;
  final double verticalPadding;
  final double horizontalPadding;
  final EdgeInsets margin;

  const CLOutlinedButton({
    this.text,
    this.onPressed,
    this.icon,
    this.width,
    this.verticalPadding = AppStyles.spacing_normal,
    this.horizontalPadding = AppStyles.spacing_normal,
    this.margin = const EdgeInsets.only(right: AppStyles.spacing_normal),
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      pressedOpacity: 0.5,
      child: Container(
        //
        // If we set a width, let use the passed width
        // otherwise set the button full
        //
        width: width != null ? width : double.infinity,

        //
        // If we dont set a width, means we want the button to be full width
        // thus lets set a bigger MARGIN
        //
        margin: margin,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          //
          // Only applies the gradient if it's a primary button
          //
          borderRadius: width == null
              ? AppStyles.borderRadius15
              : AppStyles.borderRadius10,
          //
          // Only applies the border
          //
          border: Border.all(color: AppStyles.primaryColor, width: 1.0),
        ),
        child: Row(
          //
          // If button has an icon, set space between, otherwise center
          //
          mainAxisAlignment: icon == null
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceAround,
          children: [
            //
            // Button text
            //
            Text(
              text,
              style: GoogleFonts.comfortaa(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppStyles.primaryColor,
              ),
            ),
            //
            // Button icon
            //
            icon != null
                ? Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
