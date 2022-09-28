import 'package:sistapedia/user.dart';

class UserCollection {
  List<User> users;
  User currentUser;

  UserCollection() {
    users = new List<User>();
  }

  addUser(User user) {
    users.add(user);
  }

  List<User> getUsers() {
    return users;
  }

  User getUser() {
    return currentUser;
  }

  setUser(User user) {
    this.currentUser = user;
  }
}
