import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Data data;
  final double fontSize = 20.0;
  final TextStyle labelStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    letterSpacing: 2.0,
  );
  final TextStyle dataStyle = TextStyle(
    fontSize: 20.0,
    letterSpacing: 2.0,
    color: Colors.blueGrey,
  );

  Result(this.data);

  var defaultText = TextStyle(color: Colors.black);
  var linkText = TextStyle(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormScreen.mainAppBar,
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Expanded(child: Text("Name:", style: labelStyle)),
                  Expanded(child: Text(data.name, style: dataStyle))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(child: Text("Phone:", style: labelStyle)),
                  Expanded(child: Text(data.phone, style: dataStyle))
                ],
              ),
            ],
          )),
          RichText(
              text: TextSpan(children: [
            TextSpan(style: defaultText, text: "To learn more  "),
            TextSpan(
                style: linkText,
                text: "Click here",
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    var url = "https://internship.zuri.team/";

                    if (await canLaunch(url)) {
                      await launch(url);
                    }
                  })
          ])),
          FormScreen.footer
        ],
      ),
    );
  }
}
