import 'package:clubbers/app/shared/components/SVGIcon.dart';
import 'package:clubbers/app/shared/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

/*
  FORM INPUT COMPONENT

  This component draws an animated input field.
  We could use flutter's defualt input, but it doenst work 
  the way we want it. ( the animated label animates above the border)

  This component is made of three  components:
    1. fieldShape() is responsible for the background and borders
    2. customInputLabel() is responsible for the animated label
    3. customTextField() is responsible the input 

  customTextField() will tell us when the input if on focus and if it has
  a value. So we can animate the label properly.

*/

class FormInput extends StatefulWidget {
  final String fieldName;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final Function onChanged;
  final IconData icon;

  const FormInput({
    this.fieldName,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.textInputAction,
    this.icon,
  });

  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  FocusNode focusNode = new FocusNode();
  final textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
    textFieldController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppStyles.spacing_normal),
      child: Stack(
        children: [
          fieldShape(),
          fieldIcon(focusNode, widget),
          customInputLabel(textFieldController, focusNode, widget),
          customTextField(textFieldController, focusNode, widget),
        ],
      ),
    );
  }
}

Widget fieldIcon(focusNode, widget) {
  return widget.icon != null
      ? Positioned(
          top: AppStyles.spacing_normal,
          right: AppStyles.spacing_normal,
          child: Icon(
            widget.icon,
            size: 20,
            color: focusNode.hasFocus
                ? AppStyles.primaryColor
                : AppStyles.bodyColor.withOpacity(0.7),
          ),
        )
      : SizedBox();
}

/*
  This widget manages the label
  the label is animated when the input (customTextField)
  is on focus or the have some text value
*/
Widget customInputLabel(textFieldController, focusNode, widget) {
  // Check if the input has a value
  var hasText = textFieldController.text == '';

  return AnimatedPadding(
    padding: EdgeInsets.only(
        // If the input is on focus or have a value
        // we animate the label up
        top: focusNode.hasFocus || !hasText ? 5.0 : 18.0,
        left: AppStyles.spacing_normal),
    duration: Duration(milliseconds: 200),
    child: AnimatedDefaultTextStyle(
      style: TextStyle(
          // If the input is on focus or have a value
          // we animate the label font size to scale it down
          fontSize: focusNode.hasFocus || !hasText ? 12 : 16,
          color:
              // If the input is on focus
              // we animate the color of the label
              focusNode.hasFocus
                  ? AppStyles.primaryColor
                  : AppStyles.bodyColor),
      duration: Duration(milliseconds: 200),
      child: Text(widget.fieldName),
    ),
  );
}

/*
  This widget manages the input itself
  and controls the focus with the focusNode controller

  Use textFieldController to give us information regardin the text field
  we use it on customInputLabel to know if the field has a value
  and animate the label up
*/
TextField customTextField(textFieldController, focusNode, widget) {
  return TextField(
    focusNode: focusNode,
    onChanged: widget.onChanged,
    keyboardType: widget.keyboardType,
    textInputAction: widget.textInputAction,
    controller: textFieldController,
    decoration: InputDecoration(
      fillColor: Color(0xFFF4F9FE),
      contentPadding: const EdgeInsets.only(top: 45.0, left: 16.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppStyles.bodyColor.withOpacity(0),
        ),
        borderRadius: AppStyles.borderRadius10,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppStyles.bodyColor.withOpacity(0),
          width: 1.0,
        ),
        borderRadius: AppStyles.borderRadius10,
      ),
    ),
  );
}

/*
  This widget is responsable for the shape of the input:
  border, border-radius, background
*/
Container fieldShape() {
  return Container(
    height: 55,
    decoration: BoxDecoration(
      color: Color(0xFFF4F9FE),
      borderRadius: AppStyles.borderRadius10,
      border: Border.all(
        width: 1.0,
        color: AppStyles.bodyColor.withOpacity(0.3),
      ),
    ),
  );
}
