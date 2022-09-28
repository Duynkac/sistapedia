import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistapedia/home.dart';
import 'package:sistapedia/login.dart';
import 'package:sistapedia/profile.dart';
import 'data.dart' as data;

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  List<Item> _items = generateItems();
  bool isLiked = false;
  bool isOnHome = false;
  bool isOnAbout = false;
  bool isOnAuthor = false;
  bool isOnLogIn = false;
  bool isOnMyProfile = false;

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
                                      "About",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Expanded(
                                    child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white)),
                                  child: Row(
                                    children: [
                                      //Expanded(flex: 1, child: Container()),
                                      Expanded(
                                        flex: 1,
                                        child: ListView(
                                          children: [
                                            SizedBox(
                                              height: 35,
                                            ),
                                            Text(
                                              "SistaPedia™ is an online free-content encyclopedia in which women can freely share and contribute to the sum of all knowledge on topics related to those important hormonal life stages for women such as menstruation, trying to conceive (TTC), including fertility treatments such as IVF, pregnancy, miscarriage and all related topics associated with pregnancy, newborns, and new parenthood. and on through to the menopausal journey. SistaPedia™ is openly editable content. The name 'SistaPedia™' is a blending of the words Sister,(referring to the global sisterhood) and pedia (encyclopedia). SistaPedia™ articles provide links designed to guide the user to related pages with additional information. SistaPedia™is written collaboratively by the global community of volunteers who write without pay and by those who have qualifications on the medical aspects of the parenthood journey. Anyone with internet access can write and make changes to SistaPedia™ articles, except in limited cases where editing is restricted to prevent disruption or vandalism. Anyone is allowed to add or edit words, references, images and other media at SistaPedia™. SistPedia™ strives to provide the most up to date relevant information on the stated subject matter above so that the global sisterhood has the opportunity to acces whatever part of the female life stage is relevant to them. Contribution is more important than who contributes. To remain, the content must be free of copyright restrictions. It must fit within SistaPedia’s policies, including being verifiable against a published reliable source. Editors' opinions and beliefs and unreviewed research will not remain.",
                                              style: TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ),
                                      ),
                                      //Expanded(flex: 1, child: Container())
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
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
