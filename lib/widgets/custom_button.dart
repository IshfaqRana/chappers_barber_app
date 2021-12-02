import 'package:chappers/const/colors.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  CustomButton({
    this.text,
    this.onPressed,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
color: AppColor.orange,
        child: Text(
          text!,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'MetroPolis'
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
