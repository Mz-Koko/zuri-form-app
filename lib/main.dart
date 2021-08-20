import 'package:flutter/material.dart';
import 'package:formapp/model.dart';
import 'form.dart';

void main() => runApp(MaterialApp(
  home: FormApp,
));



// I will be using the n
class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coding with Koko',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: FormScreen(),
    );
  }
}



