import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistapedia/about.dart';
import 'package:sistapedia/article.dart';
import 'package:sistapedia/contribution.dart';
import 'package:sistapedia/contributions.dart';
import 'package:sistapedia/login.dart';
import 'package:sistapedia/home.dart';
import 'package:sistapedia/user.dart';

import 'data.dart' as data;
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Item> _items = generateItems();
  int selectedTopIndex = -1;
  bool isOnArticle = false;
  bool isOnHome = false;
  bool isOnAbout = false;
  bool isOnLogIn = false;
  bool isOnMyProfile = false;

  String username = data.currentUser.username;
  String displayName = data.currentUser.displayName;
  int posts = data.currentUser.posts;
  int followers = data.currentUser.followers;
  int following = data.currentUser.following;
  String bio = data.currentUser.bio;

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final titleController = TextEditingController();
  final summaryController = TextEditingController();
  final contentController = TextEditingController();

  Future<List> sendArticleData() async {
    final response =
        await http.post("http://sistapedia.com/articles.php", body: {
      "name": username,
      "title": titleController.text,
      "summary": summaryController.text,
      "content": contentController.text
    });
    // var datauser = json.decode(response.body);
    // print(datauser);
  }

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
                              onEnter: (e) => setState(() {
                                isOnHome = true;
                              }),
                              onExit: (e) => setState(() {
                                isOnHome = true;
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
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text(
                                      "Contributions",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          showDialog(
                                              child: Dialog(
                                                child: Container(
                                                  color: Colors.pinkAccent,
                                                  width: 900,
                                                  height: 700,
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/LOGO.png",
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      Text(
                                                        "Title",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      TextField(
                                                        decoration: InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border: new OutlineInputBorder(
                                                                borderSide: new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                            hintText:
                                                                "Enter the title"),
                                                        controller:
                                                            titleController,
                                                      ),
                                                      Text(
                                                        "Summary",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      TextField(
                                                        maxLines: 6,
                                                        decoration: InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border: new OutlineInputBorder(
                                                                borderSide: new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                            hintText:
                                                                "Enter the summary"),
                                                        controller:
                                                            summaryController,
                                                      ),
                                                      Text(
                                                        "Content",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      TextField(
                                                        maxLines: 12,
                                                        decoration: InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border: new OutlineInputBorder(
                                                                borderSide: new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                            hintText:
                                                                "Enter the content"),
                                                        controller:
                                                            contentController,
                                                      ),
                                                      Spacer(),
                                                      FlatButton(
                                                        child: Text(
                                                          "Save",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            Contribution
                                                                article =
                                                                new Contribution(
                                                                    titleController
                                                                        .text);

                                                            article.author = data
                                                                .currentUser
                                                                .displayName;
                                                            article.summary =
                                                                summaryController
                                                                    .text;
                                                            article.content =
                                                                contentController
                                                                    .text;
                                                            data.currentUser
                                                                .contributions
                                                                .addContribution(
                                                                    article);
                                                          });
                                                          sendArticleData();
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              context: context);
                                        })
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.pink[100],
                                      border:
                                          Border.all(color: Colors.pink[100])),
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: data.currentUser.contributions
                                          .getLength(),
                                      itemBuilder:
                                          (BuildContext context, int position) {
                                        return InkWell(
                                            onTap: () {
                                              setState(() =>
                                                  data.currentArticle = data
                                                      .currentUser
                                                      .contributions
                                                      .contributions[position]);
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ArticlePage()));
                                            },
                                            onHover: (value) {
                                              if (value) {
                                                setState(() =>
                                                    selectedTopIndex =
                                                        position);
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
                                                    child: Center(
                                                        child: Text(
                                                      data
                                                          .currentUser
                                                          .contributions
                                                          .contributions
                                                          .elementAt(position)
                                                          .title,
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                                    shape: (selectedTopIndex ==
                                                                position &&
                                                            isOnArticle)
                                                        ? RoundedRectangleBorder(
                                                            side: BorderSide(
                                                                width: 2,
                                                                color: Colors
                                                                    .grey),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20))
                                                        : RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    elevation: 5,
                                                  )),
                                            ));
                                      }),
                                ))
                              ])),
                          Expanded(
                            flex: 2,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 28,
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
                                Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "$displayName",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          showDialog(
                                              child: Dialog(
                                                child: Container(
                                                  color: Colors.pinkAccent,
                                                  width: 300,
                                                  height: 150,
                                                  child: Column(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/LOGO.png",
                                                        height: 40,
                                                        width: 40,
                                                      ),
                                                      TextField(
                                                        decoration: InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            filled: true,
                                                            border: new OutlineInputBorder(
                                                                borderSide: new BorderSide(
                                                                    color: Colors
                                                                        .teal)),
                                                            hintText:
                                                                "Update Your Name"),
                                                        controller:
                                                            nameController,
                                                      ),
                                                      Spacer(),
                                                      FlatButton(
                                                        child: Text(
                                                          "Save",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            data.currentUser
                                                                    .displayName =
                                                                nameController
                                                                    .text;
                                                            displayName = data
                                                                .currentUser
                                                                .displayName;
                                                          });
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              context: context);
                                        },
                                      )
                                    ]),
                                Text(
                                  "@$username",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 15),
                                ),
                                SizedBox(height: 15),
                                Container(
                                    child: Row(
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Posts",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("$posts")
                                          ],
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Followers",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("$followers")
                                          ],
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Following",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text("$following")
                                          ],
                                        )),
                                  ],
                                )),
                                SizedBox(
                                  height: 20,
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
                                        Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Bio",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  showDialog(
                                                      child: Dialog(
                                                        child: Container(
                                                          color:
                                                              Colors.pinkAccent,
                                                          width: 300,
                                                          height: 300,
                                                          child: Column(
                                                            children: [
                                                              Image.asset(
                                                                "assets/images/LOGO.png",
                                                                height: 40,
                                                                width: 40,
                                                              ),
                                                              TextField(
                                                                maxLines: 8,
                                                                decoration: InputDecoration(
                                                                    fillColor:
                                                                        Colors
                                                                            .white,
                                                                    filled:
                                                                        true,
                                                                    border: new OutlineInputBorder(
                                                                        borderSide: new BorderSide(
                                                                            color: Colors
                                                                                .teal)),
                                                                    hintText:
                                                                        "Update Your Bio"),
                                                                controller:
                                                                    bioController,
                                                              ),
                                                              Spacer(),
                                                              FlatButton(
                                                                child: Text(
                                                                  "Save",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    data.currentUser
                                                                            .bio =
                                                                        bioController
                                                                            .text;
                                                                    bio = data
                                                                        .currentUser
                                                                        .bio;
                                                                  });
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      context: context);
                                                },
                                              )
                                            ]),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 3,
                                          ),
                                          Text(bio),
                                        ])
                                      ],
                                    )),
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

  Contribution getArticle(String title, Contributions contributions) {
    for (int i = 0; i <= contributions.getContributions().length - 1; i++) {
      if (contributions.getContributions()[i].title == title) {
        return contributions.getContributions()[i];
      }
    }
  }
}
