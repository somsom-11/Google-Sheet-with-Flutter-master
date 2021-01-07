import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/dialog.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/util.dart';
import 'package:Google_Sheet_with_Flutter/page2/note/note.dart';

class UserDashboard extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<UserDashboard> implements AddUserCallback {

  bool _anchorToBottom = false;
  FirebaseDatabaseUtil databaseUtil;

  @override
  void initState() {
    super.initState();

    databaseUtil = new FirebaseDatabaseUtil();
    databaseUtil.initState();
  }

  @override
  void dispose() {
    super.dispose();
    databaseUtil.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // it will show title of screen

    Widget _buildTitle(BuildContext context) {
      return new InkWell(
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Meeting Plan',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }
//It will show new user icon
    List<Widget> _buildActions() {
      return <Widget>[
        new IconButton(
          icon: const Icon(
            Icons.group_add,
            color: Colors.white,
          ),               // display pop for new entry
          onPressed: () => showEditWidget(null, false),
        ),
      ];
    }

    return new Scaffold(
      appBar: new AppBar(
        title: _buildTitle(context),
        actions: _buildActions(),
      ),

      // Firebase predefile list widget. It will get user info from firebase database
      body: new FirebaseAnimatedList(
        key: new ValueKey<bool>(_anchorToBottom),
        query: databaseUtil.getUser(),
        reverse: _anchorToBottom,
        sort: _anchorToBottom
            ? (DataSnapshot a, DataSnapshot b) => b.key.compareTo(a.key)
            : null,
        itemBuilder: (BuildContext context, DataSnapshot snapshot,
            Animation<double> animation, int index) {
          return new SizeTransition(
            sizeFactor: animation,
            child: showUser(snapshot),
          );
        },
      ),
    );
  }

  @override
  void addUser(User user) {
    setState(() {
      databaseUtil.addUser(user);
    });
  }

  @override
  void update(User user) {
    setState(() {
      databaseUtil.updateUser(user);
    });
  }

  //It will display a item in the list of users.

  Widget showUser(DataSnapshot res) {
    User user = User.fromSnapshot(res);

    var item = new Card(
      child: new Container(
          child: new Center(
            child: new Row(
              children: <Widget>[
                new CircleAvatar(
                  radius: 30.0,
                  child: new Text(getShortName(user)),
                  backgroundColor: const Color(0xFF20283e),
                ),
                new Expanded(
                  child: new Padding(
                    padding: EdgeInsets.all(10.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text(
                          user.name,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.black),
                        ),
                        new Text(
                          user.email,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.grey),
                        ),
                        new Text(
                          user.mobile,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.grey),
                        ),
                        new Text(
                          user.date.toString(),
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.grey),
                        ),
                        new Text(
                          user.time.toString(),
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 18.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    new IconButton(
                      icon: const Icon(
                        Icons.edit_outlined,size: 33.0,
                        color: Color.fromARGB(950, 6, 36, 108),
                      ),
                      onPressed: () => showEditWidget(user, true),
                    ),
                    new IconButton(
                      icon: const Icon(Icons.delete_forever_rounded,
                          color: Color.fromARGB(950, 181, 32, 0),size: 35.0,),
                      onPressed: () => deleteUser(user),
                    ),
                  ],
                ),
              ],
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0)),
    );

    return item;
  }
  //Get first letter from the name of user
  String getShortName(User user) {
    String shortName = "";
    if (!user.name.isEmpty) {
      shortName = user.name.substring(0, 1);
    }
    return shortName;
  }

  showEditWidget(User user, bool isEdit) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>
          new AddUserDialog().buildAboutDialog(context, this, isEdit, user),
    );
  }

  deleteUser(User user) {
    setState(() {
      databaseUtil.deleteUser(user);
    });
  }
}