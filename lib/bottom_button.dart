import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.bottomText});
  final Function() onTap;
  final String bottomText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kbottomContainerColor,
        width: double.infinity,
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(top: 15),
        height: kbottomContainerHeight,
        child: Text(bottomText,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
      ),
    );
  }
}
