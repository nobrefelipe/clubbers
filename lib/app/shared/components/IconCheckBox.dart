import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
  ICON CHECK BOC COMPONENT

  This component draws a custom checkbox
  with an icon and title.

  When tapped, we return an object of type: 
  { title : isSelected }
  eg: { 'baladas': true}

  We animate the checkbox based on  the current 
  state of the $selected variable 

  @param title
  @param onTaps

*/

class IconCheckBox extends StatefulWidget {
  final String title;
  final Function onTap;

  const IconCheckBox({this.title, this.onTap});

  @override
  _IconCheckBoxState createState() => _IconCheckBoxState();
}

class _IconCheckBoxState extends State<IconCheckBox> {
  bool selected = false;

  void handleTap() {
    setState(() {
      selected = !selected;
    });
    widget.onTap({
      widget.title: selected,
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleTap,
      child: AnimatedContainer(
        width: 90,
        height: 90,
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          color: selected ? AppStyles.bodyColor : Colors.white,
          borderRadius: AppStyles.borderRadius10,
          border: Border.all(
            width: 1,
            color: selected ? AppStyles.bodyColor : AppStyles.primaryColor,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SVGIcon(
              icon: widget.title,
              scale: 1,
              color: selected ? Colors.white : AppStyles.primaryColor,
            ),
            Text(
              widget.title.toUpperCase(),
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: selected ? Colors.white : AppStyles.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
