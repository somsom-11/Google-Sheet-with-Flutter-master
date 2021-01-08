import 'package:Google_Sheet_with_Flutter/login/begin.dart';
import 'package:Google_Sheet_with_Flutter/login/login.dart';
import 'package:Google_Sheet_with_Flutter/login/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Mybegin extends StatefulWidget {
  @override
  _BeginPage createState() => _BeginPage();
}

class _BeginPage extends State<Mybegin>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 100.0, 0.0, 0.0),
            child: Text(
              'Hello',style: TextStyle(fontFamily: 'Lob',fontSize: 80.0,fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
            child: Text(
              'App',style: TextStyle(fontFamily: 'Lob',fontSize: 68.0,fontWeight: FontWeight.bold,color: Colors.orange),
            ),
          ),
          Column(
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 30.0, right: 50.0, left: 50.0),
                child: GestureDetector(
                  onTap: () {
                    var rount = new MaterialPageRoute(
                        builder: (BuildContext context) => new LoginPage());
                    Navigator.of(context).push(rount);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        right: 80.0, left: 80.0, top: 12.0, bottom: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.0, color: Colors.green[500]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('SIGN IN', style: TextStyle(
                        fontSize: 20.0, color: Colors.green[500],fontFamily: 'CSPraJad',fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Row(children: <Widget>[
                  Expanded(child: Divider(color: Colors.deepOrange[800])),
                  Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Don’t have an account?",
                          style: TextStyle(color: Colors.deepOrange[800],
                              fontSize: 18.0))),
                  Expanded(child: Divider(color: Colors.deepOrange[800])),
                ],),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 20.0, bottom: 30.0, right: 50.0, left: 50.0),
                child: GestureDetector(
                  onTap: () {
                    var rount = new MaterialPageRoute(
                        builder: (BuildContext context) => new SignUp());
                    Navigator.of(context).push(rount);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        right: 70.0, left: 80.0, top: 12.0, bottom: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.0, color: Colors.deepOrange[800]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Text('SIGN UP', style: TextStyle(
                        fontSize: 20.0, color: Colors.deepOrange[700],fontFamily: 'CSPraJad',fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );

  }


}

