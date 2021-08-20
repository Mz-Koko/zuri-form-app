import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model.dart';
import 'result.dart';
import 'main.dart';

class FormScreen extends StatefulWidget {
  static AppBar mainAppBar = AppBar(
    title: Text('Form App'),
    centerTitle: true,
    backgroundColor: Colors.indigo,
  );

  static Align footer = Align(
    alignment: Alignment.bottomCenter,
    child: Text(
      'Designed by Iheanetu Kodlinye Mike',
      style: TextStyle(
        height: 10,
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.blueGrey,
      ),
    ),
  );
  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  Data _data = new Data();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FormScreen.mainAppBar,
      body: Column(
        children: [
          Expanded(child: Container(
            margin: EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      if(value.length < 4){
                        return 'Name must be at least 4 characters';
                      }
                      if(RegExp(r"\d").hasMatch(value)){
                        return 'Name cannot contain digits';
                      }
                    },
                    onSaved: (String? value) {
                      _data.name = value ?? "";
                    },
                  ),TextFormField(
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone is required';
                      }
                      if(!RegExp(r"\d{11,13}").hasMatch(value)){
                        return 'Phone must be between 11 and 13 digits';
                      }
                    }, keyboardType: TextInputType.phone,
                    onSaved: (String? value) {
                      _data.phone = value ?? "";
                    },
                  ),
                  SizedBox(height: 50),
                  RaisedButton(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.blue, fontSize: 16),
                    ),
                    onPressed: () {
                      if (_formKey.currentState?.validate() == true)
                      {
                        (_formKey.currentState as FormState).save();
                        Navigator.push(context, MaterialPageRoute(builder: (c) => Result(this._data)));
                      }

                    },
                  )
                ],
              ),
            ),
          )),
          FormScreen.footer
        ],
      ),
    );
  }
}
