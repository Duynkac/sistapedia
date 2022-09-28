import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistapedia/about.dart';
import 'package:sistapedia/article.dart';
import 'package:sistapedia/login.dart';
import 'package:sistapedia/profile.dart';
import 'data.dart' as data;

List<String> myList = List<String>(8);

class Item {
  Item({this.headerValue, this.isExpanded = false});

  String headerValue;
  bool isExpanded;
}

List<Item> generateItems() {
  myList[0] = "Parenthood";
  myList[1] = "Clinics";
  myList[2] = "Fertility";
  myList[3] = "Conception";
  myList[4] = "IVF";
  myList[5] = "Miscarriage";
  myList[6] = "Pregnancy";
  myList[7] = "Newborns";
  return List.generate(8, (index) {
    return Item(
      headerValue: myList[index],
    );
  });
}

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> _items = generateItems();
  int selectedTopIndex = -1;
  int selectedRecIndex = -1;
  bool isOnHome = false;
  bool isOnAbout = false;
  bool isOnArticle = false;
  bool isOnLogIn = false;
  bool isOnMyProfile = false;
  String username = data.currentUser.displayName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
              flex: 15,
              child: Container(
                color: Colors.pinkAccent,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Image.asset(
                      "assets/images/LOGO.png",
                      height: 100,
                      width: 100,
                    ),
                    Center(
                      child: Text(
                        "SistaPedia™",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 10),
                    ExpansionPanelList(
                      dividerColor: Colors.grey,
                      expansionCallback: (int index, bool isExpanded) {
                        setState(() {
                          _items[index].isExpanded = !isExpanded;
                        });
                      },
                      children: _items.map<ExpansionPanel>((Item item) {
                        return ExpansionPanel(
                          headerBuilder:
                              (BuildContext context, bool isExpanded) {
                            return ListTile(
                              title: Text(item.headerValue),
                            );
                          },
                          body: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Most useful Articles",
                              ),
                              SizedBox(height: 10),
                              Text(
                                "New Articles",
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Your Story",
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                          isExpanded: item.isExpanded,
                        );
                      }).toList(),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 85,
              child: Container(
                padding: EdgeInsets.all(15.0),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 10,
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                              );
                            },
                            child: MouseRegion(
                              onEnter: (e) => setState(() {
                                isOnHome = true;
                              }),
                              onExit: (e) => setState(() {
                                isOnHome = false;
                              }),
                              child: isOnHome
                                  ? Text("Home",
                                      style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.underline))
                                  : Text("Home",
                                      style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          SizedBox(width: 25),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AboutPage()),
                              );
                            },
                            child: MouseRegion(
                              onEnter: (e) => setState(() {
                                isOnAbout = true;
                              }),
                              onExit: (e) => setState(() {
                                isOnAbout = false;
                              }),
                              child: isOnAbout
                                  ? Text("About",
                                      style: TextStyle(
                                          color: Colors.black,
                                          decoration: TextDecoration.underline))
                                  : Text("About",
                                      style: TextStyle(color: Colors.black)),
                            ),
                          ),
                          SizedBox(width: 25),
                          Text("Featured",
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 25),
                          Text("Authors",
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 25),
                          Text("Contact us",
                              style: TextStyle(color: Colors.black)),
                          SizedBox(width: 25),
                          IconButton(
                              icon: Icon(Icons.search, color: Colors.black),
                              onPressed: null),
                          Spacer(),
                          buildLogIn(),
                          SizedBox(width: 25),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                          child: Row(
                        children: [
                          Text(
                            "Hi $username, Welcome to Sistapedia!",
                            style: TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )),
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                            child: Row(
                          children: [
                            Text("Top Articles of the Day",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        ))),
                    Expanded(
                        flex: 30,
                        child: Container(
                            color: Colors.pinkAccent,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ArticlePage()));
                                      },
                                      onHover: (value) {
                                        if (value) {
                                          setState(() =>
                                              selectedTopIndex = position);
                                        }
                                      },
                                      child: Container(
                                        width: 300,
                                        height: 200,
                                        child: MouseRegion(
                                            onEnter: (e) => setState(() {
                                                  isOnArticle = true;
                                                }),
                                            onExit: (e) => setState(() {
                                                  isOnArticle = false;
                                                }),
                                            child: Card(
                                              shape: (selectedTopIndex ==
                                                          position &&
                                                      isOnArticle)
                                                  ? RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20))
                                                  : RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                              elevation: 5,
                                            )),
                                      ));
                                }))),
                    Expanded(flex: 5, child: Container()),
                    Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Text("Recommended",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        )),
                    Expanded(
                        flex: 30,
                        child: Container(
                            color: Colors.pinkAccent,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder:
                                    (BuildContext context, int position) {
                                  return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ArticlePage()));
                                      },
                                      onHover: (value) {
                                        if (value) {
                                          setState(
                                            () => selectedRecIndex = position,
                                          );
                                        }
                                      },
                                      child: Container(
                                          width: 300,
                                          height: 200,
                                          child: Card(
                                            shape: (selectedRecIndex ==
                                                    position)
                                                ? RoundedRectangleBorder(
                                                    side: BorderSide(
                                                        width: 2,
                                                        color: Colors.grey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20))
                                                : RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                            elevation: 5,
                                          )));
                                }))),
                    Expanded(flex: 10, child: Container()),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget buildLogIn() {
    if (data.isLoggedin == false) {
      return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LogInPage()),
          );
        },
        child: MouseRegion(
          onEnter: (e) => setState(() {
            isOnLogIn = true;
          }),
          onExit: (e) => setState(() {
            isOnLogIn = false;
          }),
          child: isOnLogIn
              ? Text("Log In",
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline))
              : Text("Log In", style: TextStyle(color: Colors.black)),
        ),
      );
    } else {
      return Row(children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: MouseRegion(
            onEnter: (e) => setState(() {
              isOnMyProfile = true;
            }),
            onExit: (e) => setState(() {
              isOnMyProfile = false;
            }),
            child: isOnMyProfile
                ? Text("My Profile",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline))
                : Text("My Profile", style: TextStyle(color: Colors.black)),
          ),
        ),
        SizedBox(width: 25),
        InkWell(
          onTap: () {
            data.isLoggedin = false;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
          child: MouseRegion(
            onEnter: (e) => setState(() {
              isOnLogIn = true;
            }),
            onExit: (e) => setState(() {
              isOnLogIn = false;
            }),
            child: isOnLogIn
                ? Text("Log Out",
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline))
                : Text("Log Out", style: TextStyle(color: Colors.black)),
          ),
        )
      ]);
    }
  }
}
