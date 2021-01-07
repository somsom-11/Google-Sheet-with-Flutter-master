import 'package:Google_Sheet_with_Flutter/login/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  String _email, _password, _name;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromARGB(200, 144, 109, 59),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(top: 100.0, left: 95.0, right: 35.0),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 70.0, fontFamily: 'Lob',color: Colors.pink),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please Enter UserName';
                            }
                          },
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto'),
                          onSaved: (input) => _name = input,
                          decoration: InputDecoration(
                            labelText: 'UserName',
                            labelStyle: TextStyle(
                              fontFamily: 'CSPraJad',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: Icon(Icons.https),
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.isEmpty) {
                              return 'Please Type an Email';
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                          onSaved: (input) => _email = input,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontFamily: 'CSPraJad',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: Icon(Icons.email),
                          ),
                        ),
                        TextFormField(
                          validator: (input) {
                            if (input.length < 6) {
                              return 'Please Provide a password';
                            }
                          },
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                          onSaved: (input) => _password = input,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontFamily: 'CSPraJad',
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                            icon: Icon(Icons.https),
                          ),
                          obscureText: true,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30, right: 60.0, left: 60.0),
                          child: OutlineButton(
                              onPressed: signUp,
                              color: Colors.lightGreen[500],
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                                style: BorderStyle.solid,
                              ),
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Inter',
                                ),
                              )),
                        ),
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


    // TODO: implement build
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        user.sendEmailVerification();
        Navigator.of(context).pop();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
