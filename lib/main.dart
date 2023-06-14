import 'package:flutter/material.dart';
import 'input_page.dart';

void main(){
  runApp(BMIcalculator());
}
class BMIcalculator extends StatelessWidget {
  const BMIcalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFF1E1B31),
          appBarTheme: AppBarTheme(color: Color(0xFF1E1B31)),
          scaffoldBackgroundColor: Color(0xFF1E1B31),
          textTheme:TextTheme(bodyText1:TextStyle(color: Colors.white) )
      ),
      home: InputPage(),
    );
  }
}


