import 'package:flutter/cupertino.dart';
import 'result_page.dart';

import 'input_page.dart';



class ResuableCard extends StatelessWidget {
  ResuableCard({required this.colour,  this.cardChild , this.onPress});
  final Color colour;
  final Widget? cardChild;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        // height: 200,
        // width: 170,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
        child: cardChild,

      ),
    );
  }
}
