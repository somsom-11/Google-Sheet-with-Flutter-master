import 'dart:io';

import 'package:Google_Sheet_with_Flutter/page/AddTransactionPage.dart';
import 'package:Google_Sheet_with_Flutter/page/ListTransactionPage.dart';
import 'package:Google_Sheet_with_Flutter/page2/homepage.dart';
import 'package:Google_Sheet_with_Flutter/page2/noteplan/screen/todos.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    Key key,
    @required this.user,
  }) : super(key: key);
  final FirebaseUser user;

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<Homepage>

{
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryIconTheme: IconThemeData(color: Colors.pink)),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          //leading: Icon(Icons.menu,color: Colors.pink,),
          title:  Text('Home',style: TextStyle(color: Colors.pink,fontSize: 25.0),),
          actions: <Widget>[
            Padding(padding: EdgeInsets.all(10.0),
              child: Container(
                width: 30.0,
                height: 30.0,

              ),)
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              new DrawerHeader(
                  child: new Container(
                    child: new Column(
                      children: <Widget>[
                        new Text(
                          'App',
                          style: TextStyle(
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lobster',
                              color: Colors.pink[600]),
                        ),
                        new Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              color: Colors.blue[600]),
                        ),
                        new Text('som',
                          //'${widget.user.email}',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Inter',
                              color: Colors.blue[600]),
                        ),

                      ],
                    ),
                  )),
              ListTile(
                leading: Icon(Icons.stars, color: Colors.purple[400]),
                title: Text('ข้อมูลผู้ใช้งาน',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CSPrajad',
                        color: Colors.purple[400])),
                //onTap: () {Navigator.push(
                //  context, MaterialPageRoute(builder: (context) => mybarcode()));},
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: Colors.lightGreen[600]),
                title: Text('แผนที่',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CSPrajad',
                        color: Colors.lightGreen[600])),
                onTap: () {
                  // Navigator.push(
                  //   context, MaterialPageRoute(builder: (context) => spage()));
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                leading: Icon(Icons.chat, color: Colors.yellow[700]),
                title: Text('ส่งข้อความ',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CSPrajad',
                        color: Colors.yellow[700])),
                onTap: () {
                  //  Navigator.push(
                  //    context, MaterialPageRoute(builder: (context) => Sq1()));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.power_settings_new,
                  color: Colors.deepOrange[700],
                ),
                title: Text('ออกจากระบบ',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'CSPrajad',
                        color: Colors.deepOrange[600])),
                onTap: () {
                  exit(0);
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        body: page1(),
      ),


    );

  }}


class page1 extends StatefulWidget{

  @override
  _page1 createState() => _page1();

}
class _page1 extends State<page1>{
  @override

  Widget build(BuildContext context){
    return
      ListView(
        children: [
          SizedBox(height: 15.0),
          Text('  Menu',
              style: TextStyle(
                  fontFamily: 'Varela',
                  fontSize: 42.0,
                  color: Colors.pink,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5.0),
          SafeArea(child: SingleChildScrollView(
            padding: EdgeInsets.all(2.0),
            child: Column(
              children: <Widget>[
                Center(
                  child: ListTile(
                    leading: Icon(Icons.local_atm,color: Colors.amber,),
                    title: Text('รายรับรายจ่าย',
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'CSPrajad',
                            color: Colors.yellow[700])),
                    onTap: () {
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AddTransactionPage()));
                    },

                  )
                ),
                Center(
                    child: ListTile(
                      leading: Icon(Icons.event_note_sharp,color: Colors.indigo,),
                      title: Text('วางแผนการประชุม',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CSPrajad',
                              color: Colors.indigo)),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => AddTransactionPage()));
                      },

                    )
                ),
                Center(
                    child: ListTile(
                      leading: Icon(Icons.description_outlined,color: Colors.pink,),
                      title: Text('วางแผน',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CSPrajad',
                              color: Colors.pink)),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => TodosScreen()));
                      },

                    )
                ),
                Center(
                    child: ListTile(
                      leading: Icon(Icons.list_alt_sharp,color: Colors.lightGreen,),
                      title: Text('รายการที่ต้องทำ',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CSPrajad',
                              color: Colors.lightGreen)),
                      onTap: () {
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => TodosScreen()));
                      },

                    )
                ),


              ],
            ),
          ))
        ],
      );

  }

}
