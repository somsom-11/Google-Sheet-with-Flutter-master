import 'package:Google_Sheet_with_Flutter/login/begin.dart';
import 'package:Google_Sheet_with_Flutter/page2/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password, _name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final String titleString = "Log In";
  var textEditController = new TextEditingController();


  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(top: 70.0, left: 10.0, right: 35.0),
                child: Stack(children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                    child: Text(
                      'Hello',style: TextStyle(fontFamily: 'Roboto',fontSize: 80.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 125.0, 0.0, 0.0),
                    child: Text(
                      'There',style: TextStyle(fontFamily: 'Roboto',fontSize: 80.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(225.0, 125.0, 0.0, 0.0),
                    child: Text(
                      '.',style: TextStyle(fontFamily: 'Roboto',fontSize: 80.0,fontWeight: FontWeight.bold,color: Colors.purple),
                    ),
                  )
                ],),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(colors: [
                          Colors.white38,
                          Colors.white38,
                        ])),
                    margin: EdgeInsets.all(25),
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please Type an Email';
                            }
                          },
                          style: TextStyle(
                              color: Colors.pink,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                          controller: textEditController,
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Please Provide a password';
                            }
                          },
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 21.0,
                              fontWeight: FontWeight.bold),
                          onSaved: (input) => _password = input,
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                        ),
                        Padding(padding: const EdgeInsets.all(20)),
                        Center(
                          child: GestureDetector(
                            onTap: logIn,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                              decoration: BoxDecoration(
                                border: Border.all(width: 2.0,color: Colors.pink),
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: Text('LOGIN',style: TextStyle(color: Colors.pink,fontSize: 20.0,fontFamily: 'Roboto',fontWeight: FontWeight.bold),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> logIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Homepage(user: user)));
      } catch (response) {
        String errorString = response.message;
        print('error = $errorString');
      }
    }
  }

}
