import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sistapedia/home.dart';
import 'package:sistapedia/user.dart';
import 'package:sistapedia/usercollection.dart';
import 'data.dart' as data;
import 'usercollection.dart';
import 'package:http/http.dart' as http;

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool correct = false;
  final userController = TextEditingController();
  final passController = TextEditingController();

  final userNewController = TextEditingController();
  final passNewController = TextEditingController();
  final emailNewController = TextEditingController();

  Future<List> sendSignUpData() async {
    final response =
        await http.post("http://sistapedia.com/signUpUser.php", body: {
      "username": userNewController.text,
      "email": emailNewController.text,
      "password": passNewController.text,
    });
    // var datauser = json.decode(response.body);
    // print(datauser);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User test = new User("testUser", "12345");
    data.users.addUser(test);
    return Scaffold(
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/images/LOGO.png",
                height: 200,
                width: 200,
              ),
              Center(
                child: Text(
                  "SistaPedia™",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            child: Row(
              children: [
                Expanded(child: Container(), flex: 150),
                Expanded(
                    child: Container(
                        child: Row(
                      children: [
                        Expanded(child: Container(), flex: 2),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Sign Up",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              TextField(
                                controller: emailNewController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Enter your email',
                                  labelText: 'Email',
                                  prefixIcon: const Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                controller: userNewController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Enter your username',
                                  labelText: 'Username',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                obscureText: true,
                                controller: passNewController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Enter your password',
                                  labelText: 'Password',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ButtonTheme(
                                minWidth: 350,
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.pinkAccent,
                                  child: Text("Sign Up"),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    User newUser = new User(
                                        userNewController.text,
                                        passNewController.text);
                                    data.users.addUser(newUser);
                                    sendSignUpData();

                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                              backgroundColor:
                                                  Colors.pinkAccent,
                                              title: Row(children: [
                                                Image.asset(
                                                  "assets/images/LOGO.png",
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                Text(
                                                  "You have signed up successfully!",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ]),
                                              content: Text(
                                                "You have signed up successfully!",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              actions: [
                                                FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text('close'))
                                              ]);
                                        });
                                  },
                                ),
                              )
                            ],
                          ),
                          flex: 6,
                        ),
                        Expanded(
                          child: Container(),
                          flex: 2,
                        )
                      ],
                    )),
                    flex: 349),
                Expanded(
                  child: Container(
                    color: Colors.black,
                  ),
                  flex: 2,
                ),
                Expanded(
                    child: Container(
                        child: Row(
                      children: [
                        Expanded(child: Container(), flex: 2),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Log In",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(
                                height: 35,
                              ),
                              TextField(
                                controller: userController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Enter your username',
                                  labelText: 'Username',
                                  prefixIcon: const Icon(
                                    Icons.person,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              TextField(
                                obscureText: true,
                                controller: passController,
                                decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.teal)),
                                  hintText: 'Enter your password',
                                  labelText: 'Password',
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              ButtonTheme(
                                minWidth: 350,
                                height: 50,
                                child: RaisedButton(
                                  color: Colors.pinkAccent,
                                  child: Text("Log In"),
                                  textColor: Colors.white,
                                  onPressed: () {
                                    correct = checkAccount(userController.text,
                                        passController.text, data.users);
                                    if (correct == true) {
                                      setState(() {
                                        data.isLoggedin = true;
                                        User currentUser = getUser(
                                            userController.text, data.users);
                                        data.currentUser = currentUser;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                backgroundColor:
                                                    Colors.pinkAccent,
                                                title: Row(children: [
                                                  Image.asset(
                                                    "assets/images/LOGO.png",
                                                    height: 40,
                                                    width: 40,
                                                  ),
                                                  Text(
                                                    "Incorrect username or password",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  )
                                                ]),
                                                content: Text(
                                                  "Incorrect username or password",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                actions: [
                                                  FlatButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: Text('close'))
                                                ]);
                                          });
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                          flex: 6,
                        ),
                        Expanded(
                          child: Container(),
                          flex: 2,
                        )
                      ],
                    )),
                    flex: 349),
                Expanded(child: Container(), flex: 150),
              ],
            ),
          ),
        ),
        Expanded(flex: 2, child: Container())
      ]),
    );
  }
}

bool checkAccount(String username, String password, UserCollection users) {
  bool validAccount = false;
  for (int i = 0; i <= users.getUsers().length - 1; i++) {
    if (users.getUsers()[i].username == username) {
      if (users.getUsers()[i].password == password) {
        validAccount = true;
      }
    }
  }
  return validAccount;
}

User getUser(String username, UserCollection users) {
  for (int i = 0; i <= users.getUsers().length - 1; i++) {
    if (users.getUsers()[i].username == username) {
      return users.getUsers()[i];
    }
  }
}
