import 'package:flutter/material.dart';
import 'dart:ui';
import 'dart:async';
import 'dart:convert' show json;


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final _LoginScreenState _singleton = new _LoginScreenState._internal();


  factory _LoginScreenState() {
    return _singleton;
  }
  _LoginScreenState._internal();


  bool _acceptTerms = false;
  Map<String, String> children;


  @override
  void initState() {
    super.initState();
  }


  BoxDecoration _buildBackground() {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/sigin.jpg"),
        fit: BoxFit.fitHeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Text _buildText1() {
      return Text(
        'Stock Handler - Make your work smart!',
        style: Theme.of(context).textTheme.headline,
        textAlign: TextAlign.center,

      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: _buildBackground(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Center(
                    child: ClipRect(
                      clipBehavior: Clip.antiAlias,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 20.0, left: 20.0, right: 20.0),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                _buildText1(),
                                SizedBox(height: 10.0),

                              ],
                            ),
                          ),
                          height: 350,
                          width: 350,
                          decoration: new BoxDecoration(
                              color: Colors.grey.shade200.withOpacity(0.3)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future<void> _loginErrorUser() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid User'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0),
          //backgroundColor: Colors.brown,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 1.7,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please check the role and email.',style: TextStyle(color: Colors.black,fontSize: 15.0)),
                Text('Only registered parents and teachers of cloud smart school can use this app',style: TextStyle(color: Colors.black,fontSize: 15.0)),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok',style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _loginErrorNetwork() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Server Error'),
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 1.7,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please try again later',style: TextStyle(color: Colors.black,fontSize: 15.0)),

              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Try again!',style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  Future<void> _acceptTermsError() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 1.7,
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please accept terms and conditions',style: TextStyle(color: Colors.red,fontSize: 18.0)),

              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok',style: TextStyle(fontSize: 18.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
