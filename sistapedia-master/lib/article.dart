import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistapedia/about.dart';
import 'package:sistapedia/author.dart';
import 'package:sistapedia/home.dart';
import 'package:sistapedia/login.dart';
import 'package:sistapedia/profile.dart';
import 'data.dart' as data;

class ArticlePage extends StatefulWidget {
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List<Item> _items = generateItems();
  bool isLiked = false;
  bool isOnHome = false;
  bool isOnAbout = false;
  bool isOnAuthor = false;
  bool isOnLogIn = false;
  bool isOnMyProfile = false;

  String title = data.currentArticle.title;
  String author = data.currentArticle.author;
  String summary = data.currentArticle.summary;
  String content = data.currentArticle.content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
              flex: 20,
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
              flex: 2,
              child: Container(
                color: Colors.white,
              )),
          Expanded(
              flex: 75,
              child: Container(
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
                              opaque: true,
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
                              child: isOnHome
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
                      flex: 90,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "$title",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    Text("Author: "),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (author ==
                                                      data.currentUser
                                                          .displayName)
                                                  ? (context) => ProfilePage()
                                                  : (context) => AuthorPage()),
                                        );
                                      },
                                      child: MouseRegion(
                                        onEnter: (e) => setState(() {
                                          isOnAuthor = true;
                                        }),
                                        onExit: (e) => setState(() {
                                          isOnAuthor = false;
                                        }),
                                        child: isOnAuthor
                                            ? Text("$author",
                                                style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline))
                                            : Text(
                                                "$author",
                                              ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Row(
                                    children: [
                                      Expanded(flex: 1, child: Container()),
                                      Expanded(
                                        flex: 8,
                                        child: ListView(
                                          children: [
                                            SizedBox(
                                              height: 50,
                                            ),
                                            Text("$content"),
                                          ],
                                        ),
                                      ),
                                      Expanded(flex: 1, child: Container())
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Column(
                              children: [
                                Container(
                                  width: 250,
                                  height: 250,
                                  decoration: BoxDecoration(
                                      color: Colors.pink[100],
                                      shape: BoxShape.circle),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                    height: 250,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Summary",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text("$summary")
                                      ],
                                    )),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 40,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: IconButton(
                                          icon: isLiked
                                              ? Icon(Icons.favorite,
                                                  color: Colors.pinkAccent,
                                                  size: 30)
                                              : Icon(Icons.favorite,
                                                  color: Colors.grey, size: 30),
                                          onPressed: () {
                                            setState(() {
                                              isLiked = !isLiked;
                                              (isLiked)
                                                  ? data.currentArticle.likes +=
                                                      1
                                                  : data.currentArticle.likes -=
                                                      1;
                                            });
                                          }),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(data.currentArticle.likes.toString()),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    SizedBox(
                                      width: 20,
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.grey,
                                            size: 30,
                                          ),
                                          onPressed: null),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.white,
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
